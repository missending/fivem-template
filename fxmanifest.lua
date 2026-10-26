fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Moon'
description 'Resource template'
version '1.0.0'

shared_scripts {
    'config.lua',
    'shared/*.lua'
}

client_scripts {
    'bridge/client.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'bridge/server.lua',
    'server/*.lua'
}

ui_page 'web/dist/index.html'

files {
    'web/dist/index.html',
    'web/dist/assets/*'
}
