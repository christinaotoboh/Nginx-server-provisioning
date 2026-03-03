#!/bin/bash

echo "Checking if Nginx is running on system"
if systemctl cat nginx &> /dev/null; then
    echo "Service is installed."
else
    echo "Service is not installed."
fi

echo "Updating system and installing nginx"
sudo apt update
sudo apt install nginx -y

echo "Creating custom web directory"
sudo mkdir -p /var/www/assignment

echo "Creating index.html"
sudo tee /var/www/assignment/index.html > /dev/null <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SCA DevOps Assignment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 600px;
        }

        h1 {
            color: #1f4e79;
            margin-bottom: 10px;
        }

        h2 {
            color: #333;
            margin-top: 0;
        }

        p {
            color: #555;
            line-height: 1.6;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Christiana Otoboh-Dada</h1>
        <h2>Student ID: SCA/APC3/DO/42</h2>
        <p>
            This is my assignment submission on provisioning a web server using
            Nginx and serving a web page on it using Bash scripting.
        </p>
        <p>
            The server was configured, installed, and deployed through an automated Bash script.
        </p>
        <div class="footer">
            She Code Africa DevOps Track – Cohort 3
        </div>
    </div>
</body>
</html>

EOF

echo "Creating Nginx server block"
sudo tee /etc/nginx/sites-enabled/assignment > /dev/null <<'EOF'
server {
listen 81;
listen [::]:81;

server_name example.ubuntu.com;

root /var/www/assignment;
index index.html;

location / {
try_files $uri $uri/ =404;
}
}
EOF

echo "Testing nginx configuration"
sudo nginx -t

echo "Restarting and enabling nginx"
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Website is ready on port 81"

