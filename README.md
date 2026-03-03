# Nginx Web Server Provisioning Assignment

## Objective

The goal of this assignment is to demonstrate the ability to:

1. Use a Bash script to install and configure Nginx.

2. Create and serve a simple HTML webpage automatically.

3. Demonstrate automation of server provisioning.

## Approach
1. Bash Script Automation
	The Bash script performs all steps automatically, including:

	Updating the system packages

	Installing Nginx

	Creating the web directory

	Generating the HTML file with the student name and assignment details

	Configuring Nginx to serve the webpage

	Starting and enabling Nginx
2. The script writes an HTML file (index.html) into the /var/www/assignment/index.html file using the sudo tee
3. Nginx was configured via the script to point to the web directory to ensure that Nginx serves the HTML page automatically after script execution

## How to run
1. Make the script executable: 
	 chmod +x deploy.sh
2. Run the script with sudo : 
	sudo ./deploy.sh
3. Open a browser and navigate to your server IP, my webpage was served on port 81 <ipaddress:portno>

All steps are automated; no manual installation or configuration is needed.
If you update the HTML manually after running the script, the changes appear immediately.
Re-running the script will overwrite the HTML and reconfigure Nginx.



