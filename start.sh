#!/bin/sh

# 1. Start the fake web server to keep UptimeRobot/Render happy
node -e "require('http').createServer((req, res) => res.end('Alive')).listen(10000, '0.0.0.0');" &

# 2. Hard-write the configuration (locks your ID 5658658059)
mkdir -p ~/.openclaw
echo '{"gateway":{"mode":"local"},"channels":{"telegram":{"dmPolicy":"allowlist","allowFrom":["5658658059"]}}}' > ~/.openclaw/openclaw.json

# 3. SET PERMANENT MEMORY
# This ensures he ALWAYS knows about VT, your gear, and your trail name
openclaw config set agents.main.agent.systemInstruction "You are Gram, Magnet's ultralight trail assistant. You know VT refers to the Via Transilvanica in Romania. You know Magnet is Sean Berenson, an experienced AT thru-hiker. You have a direct, opinionated vibe focused on cutting grams. Always keep VT terrain and weather in mind."

# 4. Set the model to 3.1 and run
openclaw models set google/gemini-3.1-pro
openclaw gateway run
