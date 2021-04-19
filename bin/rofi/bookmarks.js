#!/usr/bin/env node

const fs = require('fs')
const os = require('os')

const { execSync } = require('child_process')
const root = execSync("npm root -g").toString().trim()
const py = require(`${root}/pinyin`)

/**
 * Main
 */

let json = JSON.parse(fs.readFileSync(os.homedir() + '/.config/google-chrome/Default/Bookmarks', 'utf8'))
let rootNode = json.roots.bookmark_bar

let bookmarks = parseBookmarkNode(rootNode)

let options = bookmarks
    .map(bm => bm.name.padEnd(150, ' ') + bm.pinyin)
    .join('\n')

let index = parseInt(execSync('rofi -dmenu -i -no-custom -format i', {input: options}))

execSync(`google-chrome-stable ${bookmarks[index].link}`)


/**
 * Functions
 */


function invisible(url) {
    invisibleUrls = [ 
        'https://chrome.google.com/webstore/',
        'https://separator.mayastudios.com/'
    ]
    return invisibleUrls.includes(url) || url.startsWith('chrome://')
}

function parseBookmarkNode(node) {
    if (node.type == 'url' && invisible(node.url)) {
        return []
    } else if (node.type == 'url') {
        return [{
            name: node.name,
            link: node.url,
            pinyin: py(node.name, {style: py.STYLE_NORMAL}).flatMap(w => w).join('')
        }]
    } else if (node.type == 'folder') {
        return node.children.flatMap(child => parseBookmarkNode(child))
    }
}
