# 🌌 Soundora Remote Audio Asset Cloud (GitHub + jsDelivr CDN)

[![Soundora](https://img.shields.io/badge/Soundora-Ambient%20Soundscape-58A6FF.svg)](https://github.com)
[![CDN](https://img.shields.io/badge/CDN-jsDelivr%20Global%20Edge-success.svg)](https://www.jsdelivr.com/)
[![Audio Format](https://img.shields.io/badge/Audio-AAC%20128kbps%20Stereo-orange.svg)](https://apple.com)
[![License](https://img.shields.io/badge/Hosting-100%25%20Free-brightgreen.svg)](https://github.com)

Đây là kho lưu trữ âm thanh đám mây (Cloud Audio Repository) phục vụ kiến trúc **Hybrid Storage** của ứng dụng **Soundora**.

Các file âm thanh cốt lõi (Core Worlds) đã được đóng gói trực tiếp trong ứng dụng offline (`assets/sounds/`). Các thế giới mở rộng và âm thanh tuỳ chọn (Space Station, Mountain Night, Temple Bells,...) được lưu trữ tại kho GitHub này và truyền phát/tải về theo nhu cầu (On-Demand Download) qua mạng CDN toàn cầu miễn phí của **jsDelivr**.

---

## 🚀 Hướng Dẫn Đẩy Lên GitHub Trong 3 Bước

### Bước 1: Tạo Repository mới trên GitHub
1. Truy cập [github.com/new](https://github.com/new).
2. Đặt tên repository: `soundora-assets` (hoặc tên bất kỳ bạn thích).
3. Chọn chế độ: **Public** (Bắt buộc để jsDelivr CDN có thể truy cập miễn phí với tốc độ tối đa).
4. Không cần tích chọn *"Add a README file"* (vì thư mục này đã có sẵn).
5. Bấm **Create repository**.

---

### Bước 2: Đẩy thư mục này lên GitHub
Mở Terminal, di chuyển vào thư mục `soundora_remote_assets` và chạy:

```bash
cd /Users/macbook/Documents/dev/soundora/soundora_remote_assets

# 1. Khởi tạo Git
git init
git checkout -b main

# 2. Thêm file và commit
git add .
git commit -m "feat: initial soundora audio cloud stems & manifest"

# 3. Kết nối với repo GitHub của bạn (thay thế URL bằng link repo vừa tạo)
git remote add origin https://github.com/<USERNAME>/soundora-assets.git

# 4. Đẩy code lên
git push -u origin main
```

*(Hoặc bạn chỉ cần chạy file tiện ích `./publish.sh <USERNAME>/soundora-assets` đã được chuẩn bị sẵn trong thư mục này).*

---

### Bước 3: Cấu hình URL trong ứng dụng Soundora
Sau khi push lên GitHub `main`, toàn bộ file âm thanh sẽ ngay lập tức có link CDN toàn cầu với định dạng:

```text
https://cdn.jsdelivr.net/gh/<USERNAME>/soundora-assets@main/sounds/<FILE_NAME>.m4a
```

- URL Repo: `git@github.com:xilhwrd/soundora-assets.git`
- CDN Base: `https://cdn.jsdelivr.net/gh/xilhwrd/soundora-assets@main/sounds/`
  - `https://cdn.jsdelivr.net/gh/xilhwrd/soundora-assets@main/sounds/space_drone.m4a`
  - `https://cdn.jsdelivr.net/gh/xilhwrd/soundora-assets@main/sounds/temple_bell.m4a`
  - `https://cdn.jsdelivr.net/gh/macbook/soundora-assets@main/sounds_manifest.json`

---

## 📁 Cấu Trúc Thư Mục

```text
soundora_remote_assets/
├── index.html              # Trang nghe thử âm thanh trực tiếp trên trình duyệt
├── sounds_manifest.json    # Danh mục JSON chứa metadata & dung lượng từng file
├── publish.sh              # Script hỗ trợ 1-click push lên GitHub
├── README.md               # Tài liệu hướng dẫn chi tiết
└── sounds/                 # Thư mục chứa các track âm thanh (.m4a AAC)
    ├── space_drone.m4a     # 215 KB - Deep Space Drone
    ├── space_hum.m4a       # 297 KB - Life Support Recycler
    ├── cosmic_noise.m4a    # 255 KB - Cosmic Pink Noise
    ├── mountain_gale.m4a   # 293 KB - Alpine Ridge Gale
    ├── cabin_rumble.m4a    # 297 KB - Pressurized Cabin Hum
    ├── temple_bell.m4a     # 174 KB - Kyoto Temple Singing Bell
    └── bamboo_wind.m4a     # 296 KB - Bamboo Grove Wind
```

---

## 🎧 Tiêu Chuẩn Kỹ Thuật Âm Thanh (Audio Specifications)

Tất cả các tệp âm thanh trong kho này đều được tổng hợp và chuẩn hoá theo tiêu chuẩn phòng thu:
- **Định dạng container**: `.m4a` (Apple MPEG-4 Audio)
- **Audio Codec**: AAC-LC (Advanced Audio Coding)
- **Bitrate**: 128 kbps Stereo VBR
- **Tần số lấy mẫu (Sample Rate)**: 44.1 kHz, 16-bit
- **Kỹ thuật lặp vô tận (Seamless Loop)**: Hermite Smoothstep boundary crossfade 2.0s ở điểm đầu và điểm cuối, đảm bảo không có bất kỳ tiếng "click" hay ngắt quãng nào khi lặp vô tận.

---

## ➕ Cách Bổ Sung Thêm Âm Thanh Mới Sau Này

1. Chuẩn bị file âm thanh (định dạng `.wav` hoặc `.mp3`).
2. Chuyển đổi sang `.m4a` chuẩn bằng lệnh macOS:
   ```bash
   afconvert -f m4af -d aac -b 128000 your_audio.wav sounds/your_audio.m4a
   ```
3. Khai báo stem mới vào `sounds_manifest.json`.
4. Commit và push:
   ```bash
   git add .
   git commit -m "add new stem: your_audio"
   git push origin main
   ```
5. CDN jsDelivr sẽ tự động cập nhật cache toàn cầu trong vòng vài phút!
