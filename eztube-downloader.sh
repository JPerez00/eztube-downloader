#!/bin/bash

# Define colors
RED='\033[1;31m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

while true; do
    clear
    echo -e "${GRAY}=================================================${NC}"
    echo -e "${RED}    _____  _____${WHITE}_____  _   _  ____   _____  "
    echo -e "${RED}   | ____||__  /${WHITE}_   _|| | | || __ ) | ____| "
    echo -e "${RED}   |  _|    / /  ${WHITE}| |  | | | ||  _ \ |  _|   "
    echo -e "${RED}   | |___  / /_  ${WHITE}| |  | |_| || |_) || |___  "
    echo -e "${RED}   |_____|/____| ${WHITE}|_|   \___/ |____/ |_____| "
    echo ""
    echo "A clean & simple script for downloading YouTube videos & audio."
    echo -e "${GRAY}=================================================${NC}"
    echo ""

    echo "What do you want to download?"
    echo "[1] Video Download"
    echo "[2] Audio-only (MP3)"
    read -p "Choose an option (1 or 2): " download_type
    echo ""

    video_quality=""
    if [ "$download_type" == "1" ]; then
        echo "Select Video Quality:"
        echo "[1] Best Available Quality (highest resolution and framerate)"
        echo "[2] 1080p HD Quality (up to 60fps if available)"
        echo "[3] 720p Standard HD (up to 60fps if available)"
        read -p "Choose quality (1-3): " video_choice

        case $video_choice in
            1) video_quality="bestvideo+bestaudio/best" ;;
            2) video_quality="bestvideo[height<=1080][fps<=60]+bestaudio/best[height<=1080][fps<=60]" ;;
            3) video_quality="bestvideo[height<=720][fps<=60]+bestaudio/best[height<=720][fps<=60]" ;;
            *) video_quality="bestvideo+bestaudio/best" ;;
        esac
        echo ""
    fi

    echo "Where should the file be saved?"
    echo "[1] YouTube folder (~/Downloads/YouTube)"
    echo "[2] Other Videos folder (~/Downloads/Other Videos)"
    read -p "Choose (1 or 2): " save_choice

    if [ "$save_choice" == "1" ]; then
        save_path="$HOME/Downloads/YouTube"
    else
        save_path="$HOME/Downloads/Other Videos"
    fi

    mkdir -p "$save_path"

    read -p "Enter the YouTube URL: " url
    echo ""

    if [ "$download_type" == "1" ]; then
        echo "[INFO] Downloading Video..."
        yt-dlp -f "$video_quality" --merge-output-format mkv \
               --cookies-from-browser chrome \
               -o "$save_path/%(title)s.%(ext)s" "$url"
    else
        echo "[INFO] Downloading Audio (MP3)..."
        yt-dlp -x --audio-format mp3 \
               --cookies-from-browser chrome \
               -o "$save_path/%(title)s.%(ext)s" "$url"
    fi

    echo "[DONE] File saved to $save_path"
    echo ""

    read -p "Do you want to download another? [Y/N]: " again
    case $again in
        [Yy]*) continue ;;
        *) echo "Exiting EzTube Downloader. Goodbye!" ; sleep 2 ; exit 0 ;;
    esac
done
