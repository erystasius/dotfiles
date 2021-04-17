#!/usr/bin/env node

const fs = require('fs')
const os = require('os')
const py = require('pinyin')
const execSync = require('child_process').execSync

let text = fs.readFileSync(os.homedir() + '/.config/google-chrome/Default/Bookmarks', 'utf8')
let json = JSON.parse(text)

var bms = []

function parseBookmarkNode(bm) {
//    console.log('Parsing node, name [%s]', bm.name)
    if (bm.type == 'url') {
        parseBookmarkUrlNode(bm)
    } else if (bm.type == 'folder') {
        parseBookmarkFolderNode(bm)
    }
}

function parseBookmarkUrlNode(bm) {
//    console.log('Parsing url node, name [%s], url[%s]', bm.name, bm.url);
    bms.push({
        name: bm.name,
        url: bm.url
    })
}

function parseBookmarkFolderNode(bm) {
//    console.log('Parsing folder node, name [%s], with [%s] children', bm.name, bm.children.length);
    bm.children.forEach(child => parseBookmarkNode(child))
}

parseBookmarkNode(json.roots.bookmark_bar)

var options = bms
    .map(bm => bm.name)
    .map(name => {
        let pyString = py(name, {style: py.STYLE_NORMAL}).map(group => group[0]).join('')
        return name.padEnd(150, ' ') + pyString
    })
    .join('\n')

var index = parseInt(execSync('rofi -dmenu -i -no-custom -format i', {input: options}).toString())

execSync('google-chrome-stable ' + bms[index].url)



