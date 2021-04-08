#!/usr/bin/env bash
set -euo pipefail

declare -A options=(
    [wudao]='alacritty --hold -e wd $word'
    [google]='$browser https://google.com/search?q=$word'
    [duckduckgo]='$browser https://duckduckgo.com?q=$word'
    [baidu]='$browser https://baidu.com/s?wd=$word'
    [zhihu]='$browser https://zhihu.com/search?q=$word'
    [jd]='$browser https://search.jd.com/Search?keyword=$word'
    [taobao]='$browser https://s.taobao.com/search?q=$word'
    [github]='$browser https://github.com/search?q=$word'
    [zdic]='$browser https://zdic.net/hans/$word'
    [bilibili]='$browser https://search.bilibili.com/all?keyword=$word'
    [youtube]='$browser https://youtube.com/results?search_query=$word'
    [smzdm]='$browser https://search.smzdm.com?s=$word'
    [douban]='$browser https://douban.com/search?q=$word'
    [docker]='$browser https://hub.docker.com/search?type=image\&q=$word'
    [maven]='$browser https://mvnrepository.com/search?q=$word'
    [forvo]='$browser https://zh.forvo.com/search/$word/'
    [wikipedia]='$browser https://en.wikipedia.org/wiki/Special:Search/$word'
    [wikipedia_zh]='$browser https://zh.wikipedia.org/wiki/Special:Search/$word'
    [ruanyifeng]='$browser https://duckduckgo.com/?q=site%3Aruanyifeng.com+$word'
    [amap]='$browser https://amap.com/search?query=$word'
)

browser=google-chrome-stable

word=$(zenity --entry --text "Type the word you want to search:" --width 500)

action=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -p "Search \"$word\" on")

word=$(echo $word | sed "s/\s/%20/g")

eval ${options[$action]}
