#!/bin/bash

set -e

cd /home/ubuntu/my-medusa-store

echo "Stopping existing Medusa process"
pm2 delete medusa-server || true

echo "Removing old dependencies"
rm -rf node_modules package-lock.json

echo "Installing fresh dependencies"
npm install

echo "Running database migrations"
if npx medusa db:migrate; then
  echo "Database migration successful!"
else
  echo "Database migration failed!"
  exit 1
fi

echo "AfterInstall step completed."

