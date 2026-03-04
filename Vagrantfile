# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/focal64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.12"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessible to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
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
                    Nginx and serving a web page on it using Bash vagrantfile.
                </p>
                <p>
                    The server was configured, installed, and deployed using a vagrantfile.
                </p>
                <div class="footer">
                    She Code Africa DevOps Track  Cohort 3
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
   SHELL
end
