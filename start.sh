#!/bin/sh

# 1. Start the fake web server to keep Render awake
node -e "require('http').createServer((req, res) => res.end('Alive')).listen(10000);" &

# 2. Lock in your permanent configuration
openclaw config set gateway.mode local
openclaw config set channels.telegram.dmPolicy allowlist
openclaw config set channels.telegram.allowFrom "[\"5658658059\"]"

# 3. Fire up the engine
openclaw gateway run
