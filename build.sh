#!/bin/bash

# Set variables
IMAGE_NAME="my-react-app"
DOCKER_TAG=$(date +%Y%m%d%H%M%S)

# Check if the build directory exists
if [ ! -d "build" ]; then
  echo "Error: build directory not found."
  exit 1
fi

# Build Docker image
echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${DOCKER_TAG} .

echo "Docker image ${IMAGE_NAME}:${DOCKER_TAG} built successfully."

