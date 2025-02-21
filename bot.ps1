# Prevent sleep
powercfg -change -standby-timeout-ac 0
powercfg -change -monitor-timeout-ac 0

# Run bot.py with terminal
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd /workspaces/casino-bot; python discord/bot.py" -NoNewWindow

# Remote tuner (example placeholder, replace with actual command if needed)
# Start-Process remote-tuner -ArgumentList "start"

# Private project (example placeholder, replace with actual command if needed)
# Start-Process private-project -ArgumentList "deploy"

# Deploy bot.py in private mode
python /workspaces/casino-bot/discord/bot.py --private

# Deploy bot with terminal mode and prevent sleep
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd /workspaces/casino-bot; python discord/bot.py --private" -NoNewWindow
