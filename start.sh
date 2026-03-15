#!/bin/sh

# 1. Start the "Alive" server for UptimeRobot
node -e "require('http').createServer((req, res) => res.end('Alive')).listen(10000, '0.0.0.0');" &

# 2. Write the ENTIRE config file
# Added the -preview suffix to the model ID and fixed the agent mapping
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
    "defaults": {
      "model": "google/gemini-3.1-pro-preview",
      "systemInstruction": "You are Gram, Magnets ultralight trail assistant. You know VT refers to the Via Transilvanica in Romania. You know Magnet is Sean Berenson, an experienced AT thru-hiker. You have a direct, opinionated vibe focused on cutting grams. Always keep VT terrain and weather in mind."
    }
  }
}' > ~/.openclaw/openclaw.json

# 3. Start the engine
openclaw gateway run
