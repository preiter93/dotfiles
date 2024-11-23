#!/usr/bin/env bash

function __icon_map() {
    case "$1" in
   "Alacritty")
        icon_result=":alacritty:"
        ;;
   "Default")
        icon_result=":default:"
        ;;
   "Docker" | "Docker Desktop")
        icon_result=":docker:"
        ;;
   "Finder" | "访达")
        icon_result=":finder:"
        ;;
   "Firefox")
        icon_result=":firefox:"
        ;;
   "Firefox Developer Edition" | "Firefox Nightly")
        icon_result=":firefox_developer_edition:"
        ;;
   "System Preferences" | "System Settings" | "系统设置" | "Réglages Système")
        icon_result=":gear:"
        ;;
   "GitHub Desktop")
        icon_result=":git_hub:"
        ;;
   "Chromium" | "Google Chrome" | "Google Chrome Canary")
        icon_result=":google_chrome:"
        ;;
   "Inkscape")
        icon_result=":inkscape:"
        ;;
   "iTerm" | "iTerm2")
        icon_result=":iterm:"
        ;;
   "Keynote" | "Keynote 讲演")
        icon_result=":keynote:"
        ;;
   "kitty")
        icon_result=":kitty:"
        ;;
   "Maps" | "Google Maps")
        icon_result=":maps:"
        ;;
   "Microsoft Edge")
        icon_result=":microsoft_edge:"
        ;;
   "Microsoft Excel")
        icon_result=":microsoft_excel:"
        ;;
   "Microsoft Outlook")
        icon_result=":microsoft_outlook:"
        ;;
   "Microsoft PowerPoint")
        icon_result=":microsoft_power_point:"
        ;;
   "Microsoft Remote Desktop")
        icon_result=":microsoft_remote_desktop:"
        ;;
   "Microsoft Teams" | "Microsoft Teams (work or school)")
        icon_result=":microsoft_teams:"
        ;;
   "Microsoft Word")
        icon_result=":microsoft_word:"
        ;;
   "Neovide" | "neovide")
        icon_result=":neovide:"
        ;;
   "Neovim" | "neovim" | "nvim")
        icon_result=":neovim:"
        ;;
   "Notes" | "备忘录")
        icon_result=":notes:"
        ;;
   "Numbers" | "Numbers 表格")
        icon_result=":numbers:"
        ;;
   "1Password")
        icon_result=":one_password:"
        ;;
   "ChatGPT")
        icon_result=":openai:"
        ;;
   "Postman")
        icon_result=":postman:"
        ;;
   "Safari" | "Safari浏览器" | "Safari Technology Preview")
        icon_result=":safari:"
        ;;
   "Slack")
        icon_result=":slack:"
        ;;
   "Spotify")
        icon_result=":spotify:"
        ;;
   "Sublime Text")
        icon_result=":sublime_text:"
        ;;
   "Terminal" | "终端")
        icon_result=":terminal:"
        ;;
    *)
        icon_result=":default:"
        ;;
    esac
}

__icon_map "$1"
echo "$icon_result"
