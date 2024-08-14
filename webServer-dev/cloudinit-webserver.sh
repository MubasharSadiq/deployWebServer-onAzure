#!/bin/bash

# Update package list and install Nginx
sudo apt-get update
sudo apt-get install -y nginx

# Create custom index.html
cat <<EOT > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Azure!</title>
    <style>
        body {
            background-color: #e0f7fa; /* Light teal background */
            color: #333;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: #007acc;
        }
        p {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <h1>Welcome to Your Azure Web Server!</h1>
    <p>You've successfully set up a web server on Azure.</p>
    <p>Why dont websites make great comedians? Because they all have the same background: white!</p>
    <p>But not this one! We added some color to keep things interesting. </p>
    <p>Enjoy exploring, and if the server starts telling jokes, it might just need a reboot!</p>
</body>
</html>
EOT

# Start Nginx and enable it to run on startup
sudo systemctl start nginx
sudo systemctl enable nginx

## Do not forget to Set the scripts to be executable for macUsers:
## chmod +x cloudinit-webserver.sh
