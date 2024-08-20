#!/bin/bash

# Define variables
EC2_USER="ubuntu"
EC2_HOST="ec2-13-202-150-30.ap-south-1.compute.amazonaws.com"
DOCKER_COMPOSE_FILE="docker-compose.yml"
LOCAL_DOCKER_COMPOSE_PATH="./docker-compose.yml"
REMOTE_DOCKER_COMPOSE_PATH="/home/ubuntu/docker-compose.yml"

# Copy Docker Compose file to EC2 instance
scp -i /home/vinoth/Zen/caps.pem $LOCAL_DOCKER_COMPOSE_PATH $EC2_USER@$EC2_HOST:$REMOTE_DOCKER_COMPOSE_PATH

# SSH into EC2 and run Docker Compose
ssh -i /home/vinoth/Zen/caps.pem $EC2_USER@$EC2_HOST << 'EOF'
cd /home/ubuntu
docker-compose up -d
EOF
