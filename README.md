# fivem-template

Starter for FiveM resources. ESX and QBCore, React NUI, oxmysql.

## What you get

- `bridge/` works with esx or qb, auto detects
- `web/` react + vite + typescript nui
- `client/` nui open/close, callbacks, key binding
- `server/` events + mysql example
- `shared/` helpers both sides can use

## Setup

```
cd web
npm install
npm run build
```

Run `template.sql` on your database, add `ensure fivem-template` to your server.cfg.

Press F5 or type `/template` in game.

## Config

```lua
Config.Framework = 'auto' -- 'esx', 'qb' or 'auto'
Config.Debug = false
Config.Keys.OpenMenu = 'F5'
```

## Bridge

Server

```lua
GetPlayer(src)
GetIdentifier(src)
GetMoney(src, account)
AddMoney(src, amount, account)
RemoveMoney(src, amount, account)
```

Client

```lua
GetPlayerData()
Notify(msg, type)
```

## Requirements

- [oxmysql](https://github.com/overextended/oxmysql)
- es_extended or qb-core
