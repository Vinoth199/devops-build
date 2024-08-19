#!/bin/bash

# Set variables
IMAGE_NAME="my-react-app"
DOCKER_TAG=$(date +%Y%m%d%H%M%S)

# Build Docker image.
docker build -t ${IMAGE_NAME}:${DOCKER_TAG} .
