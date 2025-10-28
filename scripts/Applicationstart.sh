#!/bin/bash

set -e 

cd /home/ubuntu/medusa-server/medusa_ecommerce_store-1

echo "Starting Medusa with PM2"
pm2 start npm --name medusa-server -- run dev 

echo "Saving PM2 process..."
pm2 save

echo "ApplicationStart step completed"
