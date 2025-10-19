# 🎬 EzTube Downloader (yt-dlp Wrapper)

![Image](/eztube-banner.png)

A clean & simple script-based MacOS video and audio downloader for YouTube videos & audio using [yt-dlp](https://github.com/yt-dlp/yt-dlp).

## ✨ Features
- Choose between **Video** or **Audio (MP3)**.
- Multiple quality options: **Best**, **1080p HD**, **720p Standard HD**.
- Saves to `~/Downloads/YouTube` or `~/Downloads/Other Videos`.
- Auto-converts videos to **MKV** (no WebM clutter).
- Supports **age-restricted videos** by using your browser cookies.

## Requirements

- **Python 3.10+**
- **yt-dlp** (YouTube downloader library)
- **FFmpeg** (required for converting video/audio and merging formats)

## 🚀 Installation

1. Install [yt-dlp](https://github.com/yt-dlp/yt-dlp).

```bash
pip install -U yt-dlp
```

or

```bash
brew install yt-dlp
```

2. Install [FFmpeg]([https://ffmpeg.org/download.html])

For macOS / Linux:

```bash
# macOS
brew install ffmpeg

# Ubuntu/Debian
sudo apt update && sudo apt install ffmpeg
```

3. Clone this Repo

```bash
git clone https://github.com/JPerez00/eztube-downloader.git
cd eztube-downloader
```

4. Make the script executable (Mac/Linux):

```bash
chmod +x eztube-downloader.sh
```

## ▶️ How to use it?

Run the script:

```bash
./eztube-downloader.sh
```

#### Follow the on-screen prompts:

- Select Video or Audio
- Pick resolution
- Choose destination
- Paste YouTube URL

## 🛠️ Age-Restricted Videos

If a video requires sign-in, yt-dlp uses your browser cookies:

```bash
yt-dlp --cookies-from-browser chrome
```

Change `chrome` to `firefox` or `edge` if needed.