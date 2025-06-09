fx_version 'cerulean'
game 'gta5'

author 'Kilian'
description 'Open Bills from players'
version '1.0.0'

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
    '@mysql-async/lib/MySQL.lua',
}

dependencies {
    'es_extended',
}
