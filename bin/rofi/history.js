#!/usr/bin/env node

const { execSync } = require('child_process')
const root = execSync('npm root -g').toString().trim()
const py = require(`${root}/pinyin`)

execSync("cp ~/.config/google-chrome/Default/History /tmp/chrome-history.db")

let sql = "select title,url from urls order by last_visit_time desc"
let history = execSync(`sqlite3 /tmp/chrome-history.db "${sql}"`)
    .toString()
    .split('\n')
    .map(line => line.split('|'))
    .map(parts => [parts.slice(0,-1), parts.slice(-1)])
    .map(grouped => [grouped[0].join('|'), grouped[1][0]])
    .map(grouped => { return {
        title: grouped[0],
        link: grouped[1],
        pinyin: py(grouped[0], {style: py.STYLE_NORMAL}).flatMap(word => word).join('')
    }})

var options = history.map(h => h.title.padEnd(150, ' ') + h.pinyin).join('\n')

let index = parseInt(execSync('rofi -dmenu -i -no-custom -format i', {input: options}))

execSync(`google-chrome-stable ${history[index].link}`)

