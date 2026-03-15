#!/bin/sh

# 1. Start the "Alive" server for UptimeRobot
node -e "require('http').createServer((req, res) => res.end('Alive')).listen(10000, '0.0.0.0');" &

# 2. Write the config file with the specific "main" agent mapping
mkdir -p ~/.openclaw
echo '{
  "gateway": {"mode": "local"},
  "channels": {
    "telegram": {
      "dmPolicy": "allowlist",
      "allowFrom": ["5658658059"]
    }
  },
  "agents": {
    "main": {
      "model": "google/gemini-3.1-pro-preview",
      "instructions": "You are Gram, Magnets ultralight trail assistant. You know Magnet is Sean Berenson, an experienced thru-hiker. You have a direct, opinionated vibe focused on all things hiking."
    }
  }
}' > ~/.openclaw/openclaw.json

# 3. Start the engine
openclaw gateway run
