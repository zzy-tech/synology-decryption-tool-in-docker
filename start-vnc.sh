#!/bin/bash
# Start Xvfb
Xvfb :0 -screen 0 1024x768x16 &
sleep 5

# Set the DISPLAY environment variable
export DISPLAY=:0

# Start the VNC server
x11vnc -display $DISPLAY -rfbport 5900 -xkb -noxrecord -noxfixes -noxdamage -passwd yourpassword -forever &

# Run the GUI application
exec /app/SynologyCloudSyncDecryptionTool
