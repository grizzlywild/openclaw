#!/bin/sh

# 1. Start the fake web server and BIND to 0.0.0.0 so Render can see it
node -e "require('http').createServer((req, res) => res.end('Alive')).listen(10000, '0.0.0.0');" &

# 2. Hard-write the configuration file
mkdir -p ~/.openclaw
echo '{"gateway":{"mode":"local"},"channels":{"telegram":{"dmPolicy":"allowlist","allowFrom":["5658658059"]}}}' > ~/.openclaw/openclaw.json

# 3. Fire up the engine
openclaw gateway run
