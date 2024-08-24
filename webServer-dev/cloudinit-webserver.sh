#!/bin/bash

# Update package list and install Nginx
sudo apt-get update
sudo apt-get install -y nginx

# index.html
cat << EOT > /var/www/html/index.html
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
    <h1>Welcome!</h1>
    <p>You've successfully landed on Mubashar Web Page.</p>
    <p>Thank you for visiting</p>
</body>
</html>
EOT

# Start Nginx and enable it to run on startup
sudo systemctl start nginx
sudo systemctl enable nginx