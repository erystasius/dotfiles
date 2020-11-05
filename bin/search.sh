#!/usr/bin/env bash
set -euo pipefail

declare -A options=(
    [google]='chromium https://google.com/search?q=$word'
    [duckduckgo]='chromium https://duckduckgo.com?q=$word'
    [baidu]='chromium https://baidu.com/s?wd=$word'
    [zhihu]='chromium https://zhihu.com/search?q=$word'
    [jd]='chromium https://search.jd.com/Search?keyword=$word'
    [taobao]='chromium https://s.taobao.com/search?q=$word'
    [github]='chromium https://github.com/search?q=$word'
    [zdic]='chromium https://zdic.net/hans/$word'
    [bilibili]='chromium https://search.bilibili.com/all?keyword=$word'
    [youtube]='chromium https://youtube.com/results?search_query=$word'
    [wudao]='alacritty --hold -e wd $word'
    [smzdm]='chromium https://search.smzdm.com?s=$word'
    [douban]='chromium https://douban.com/search?q=$word'
    [docker]='chromium https://hub.docker.com/search?type=image\&q=$word'
    [maven]='chromium https://mvnrepository.com/search?q=$word'
    [forvo]='chromium https://zh.forvo.com/search/$word/'
)

word=$(zenity --entry --text "Type the word you want to search:" --width 500)

action=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -p "Search \"$word\" on")

word=$(echo $word | sed "s/\s/%20/g")

eval ${options[$action]}
