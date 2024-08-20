#!/bin/bash

# Set variables
SERVER_IP="ec2-13-202-150-30.ap-south-1.compute.amazonaws.com"
SSH_USER="ubuntu"
DOCKER_COMPOSE_FILE="docker-compose.yml"
BUILD_FOLDER="build"

# Copy Docker Compose file and build folder to EC2
scp -o StrictHostKeyChecking=no ${DOCKER_COMPOSE_FILE} ${SSH_USER}@${SERVER_IP}:/home/${SSH_USER}/
scp -o StrictHostKeyChecking=no -r ${BUILD_FOLDER} ${SSH_USER}@${SERVER_IP}:/home/${SSH_USER}/

# SSH into EC2 and run Docker Compose
ssh -tt -o StrictHostKeyChecking=no ${SSH_USER}@${SERVER_IP} "docker-compose -f /home/${SSH_USER}/${DOCKER_COMPOSE_FILE} up -d"
