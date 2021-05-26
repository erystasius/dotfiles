#!/usr/bin/env bash
set -euo pipefail

declare -A options=(
    # terminal
    [wudao]='alacritty --hold -e wd $word'
    # native site search
    [jd]='$browser https://search.jd.com/Search?keyword=$word'
    [zdic]='$browser https://zdic.net/hans/$word'
    [amap]='$browser https://amap.com/search?query=$word'
    [baidu]='$browser https://baidu.com/s?wd=$word'
    [zhihu]='$browser https://zhihu.com/search?q=$word'
    [smzdm]='$browser https://search.smzdm.com?s=$word'
    [maven]='$browser https://mvnrepository.com/search?q=$word'
    [forvo]='$browser https://zh.forvo.com/search/$word/'
    [taobao]='$browser https://s.taobao.com/search?q=$word'
    [github]='$browser https://github.com/search?q=$word'
    [google]='$browser https://google.com/search?q=$word'
    [douban]='$browser https://douban.com/search?q=$word'
    [docker]='$browser https://hub.docker.com/search?type=image\&q=$word'
    [bthome]='$browser http://91btbtt.com/search-index-keyword-$word.htm'
    [mankier]='$browser https://www.mankier.com/?q=$word'
    [youtube]='$browser https://youtube.com/results?search_query=$word'
    [bilibili]='$browser https://search.bilibili.com/all?keyword=$word'
    [amazon_cn]='$browser https://www.amazon.cn/s?k=$word'
    [wikipedia]='$browser https://en.wikipedia.org/wiki/Special:Search/$word'
    [duckduckgo]='$browser https://duckduckgo.com?q=$word'
    [wikipedia_zh]='$browser https://zh.wikipedia.org/wiki/Special:Search/$word'
    [cyclone-confluence]='$browser https://cyclone-robotics.atlassian.net/wiki/search?text=$word'
    # search engine site search
    [draveness]='$browser https://duckduckgo.com/?q=site%3Adraveness.me+$word'
    [ruanyifeng]='$browser https://duckduckgo.com/?q=site%3Aruanyifeng.com+$word'
)

browser=google-chrome-stable

word=$(zenity --entry --text "Type the word you want to search:" --width 500)

action=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -p "Search \"$word\" on")

word=$(echo $word | sed "s/\s/%20/g")

eval ${options[$action]}
