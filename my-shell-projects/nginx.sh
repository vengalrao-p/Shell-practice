 #!/bin/bash

# Update package list
sudo apt-get update

# Install Nginx
sudo apt-get install nginx -y

# Start and enable Nginx using systemctl 
sudo systemctl start nginx
sudo systemctl enable nginx
