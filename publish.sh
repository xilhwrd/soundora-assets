#!/usr/bin/env bash
# ==============================================================================
# Soundora Cloud Audio Repository - One-Click Git Setup & Push Script
# Usage: ./publish.sh <your_github_username>/<repo_name>
# Example: ./publish.sh macbook/soundora-assets
# ==============================================================================

set -e

REPO_TARGET=$1

echo "======================================================"
echo "   Soundora Remote Audio Assets - GitHub Publisher"
echo "======================================================"

if [ -z "$REPO_TARGET" ]; then
    echo "⚠️  Lỗi: Vui lòng cung cấp tên repo GitHub theo dạng <username>/<repo_name>."
    echo "Ví dụ: ./publish.sh myusername/soundora-assets"
    echo ""
    read -p "Nhập username/repo của bạn (ví dụ: macbook/soundora-assets): " REPO_TARGET
fi

if [ -z "$REPO_TARGET" ]; then
    echo "❌ Hủy thao tác vì chưa nhập thông tin repo."
    exit 1
fi

REMOTE_URL="https://github.com/${REPO_TARGET}.git"

echo "➡️  Đang chuẩn bị đẩy lên: $REMOTE_URL"

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    git init
    git checkout -b main || git branch -M main
    echo "✓ Đã khởi tạo Git repository (branch: main)"
else
    git branch -M main
fi

# Add all files
git add .
git commit -m "feat: initial soundora on-demand cloud stems & manifest" || echo "Không có thay đổi mới để commit."

# Setup remote origin
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"
echo "✓ Đã liên kết remote origin: $REMOTE_URL"

echo ""
echo "🚀 Đang push lên GitHub main branch..."
git push -u origin main

echo ""
echo "======================================================"
echo "🎉 THÀNH CÔNG! Kho âm thanh đã được đẩy lên GitHub!"
echo "Link CDN mẫu để sử dụng:"
echo "👉 https://cdn.jsdelivr.net/gh/${REPO_TARGET}@main/sounds/space_drone.m4a"
echo "👉 https://cdn.jsdelivr.net/gh/${REPO_TARGET}@main/sounds_manifest.json"
echo "======================================================"
