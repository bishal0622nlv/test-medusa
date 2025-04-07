#!/bin/bash

#Stop and kill the existing Medusa process
echo "Stopping Medusa..."
pm2 stop medusa
echo "Deleting Medusa process..."
pm2 delete medusa
#
## Navigate to the project directory
#echo "Navigating to project directory..."
#cd ~/admin.pye.testnlv.nl/py-staco-store/

# Build the project
 echo "NPM install in the project..."
 npm install

# Wait for the build to complete
 echo "Waiting for NPM install to complete..."
 wait

# Build the project
 echo "Building the project..."
 npm run build

# Wait for the build to complete
 echo "Waiting for build to complete..."
 wait

# echo "Copying environment variables..."
 cp .env .medusa/server/.env.production
 cp .env .medusa/server/.env

# Set the environment variable
# echo "Setting NODE_ENV to production..."
# export NODE_ENV=production

# Navigate to the Medusa server directory
# echo "Navigating to Medusa server directory..."
# cd .medusa/server

 echo "NPM Start..."
# npm run start



# Start the Medusa process using pm2
echo "Starting Medusa with PM2..."
#pm2 start "npm run dev" --name medusa
pm2 start npm --name medusa -- start
echo "Medusa started successfully."

