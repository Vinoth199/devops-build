#!/bin/bash

# Define variables
EC2_USER="ubuntu"
EC2_HOST="ec2-13-202-150-30.ap-south-1.compute.amazonaws.com"
DOCKER_COMPOSE_FILE="docker-compose.yml"
LOCAL_DOCKER_COMPOSE_PATH="./docker-compose.yml"
REMOTE_DOCKER_COMPOSE_PATH="/home/ubuntu/docker-compose.yml"
SSH_KEY_PATH="/home/vinoth/Zen/caps.pem"

# Ensure the SSH key has the correct permissions
chmod 400 $SSH_KEY_PATH

# Copy Docker Compose file to EC2 instance
scp -i $SSH_KEY_PATH $LOCAL_DOCKER_COMPOSE_PATH $EC2_USER@$EC2_HOST:$REMOTE_DOCKER_COMPOSE_PATH

# SSH into EC2 and run Docker Compose
ssh -i $SSH_KEY_PATH $EC2_USER@$EC2_HOST << 'EOF'
# Check and stop any container using port 80
docker ps -q --filter "publish=80" | xargs -r docker stop

# Start the Docker Compose application
cd /home/ubuntu
docker-compose up -d
EOF

