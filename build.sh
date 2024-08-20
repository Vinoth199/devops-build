#!/bin/bash

# Set variables
IMAGE_NAME="my-react-app"
DOCKER_TAG=$(date +%Y%m%d%H%M%S)

# Install dependencies and build React app
echo "Installing dependencies and building React app..."
npm install  # or yarn install
npm run build  # or yarn build

# Check if the build directory exists
if [ ! -d "build" ]; then
  echo "Error: build directory not found. Build process failed."
  exit 1
fi

# Build Docker image
echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${DOCKER_TAG} .

echo "Docker image ${IMAGE_NAME}:${DOCKER_TAG} built successfully."

