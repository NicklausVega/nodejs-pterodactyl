#!/bin/bash
cd /home/container

# Print Node version just for logging (optional)
echo "Using Node version: $(node -v)"

# Replace Startup Variables
# Pterodactyl uses variables like {{SERVER_PORT}} in the Startup command.
# This line transforms them into $SERVER_PORT for bash.
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed 's/{{/${/g; s/}}/}/g')`

echo ":/home/container$ ${MODIFIED_STARTUP}"

# Execute the command
exec env ${MODIFIED_STARTUP}
