# -*- mode: ruby -*-
# vi: set ft=ruby :

# A Vagrantfile to set up three VMs, two webservers and a database server.
Vagrant.configure("2") do |config|

# My servers will run Ubuntu software as I have been using it in the labs so far.
  config.vm.box = "ubuntu/xenial64"

# This sets up a VM for hosting my front end web server.
  config.vm.define "fwebserver" do |fwebserver|
     
# The name of my web server. 
  fwebserver.vm.hostname = "fwebserver"

# Portforwarding. 
# This means the host can connect to IP address 127.0.0.1 port 8080, 
#  and that network request will reach our webserver VM's port 80.
     fwebserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

# Set up a private network IP. This will allow VMs to communicate.
     fwebserver.vm.network "private_network", ip: "192.168.2.11"
          
# Sets up permissions for CS labs to access. 
    fwebserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    fwebserver.vm.provision "shell", path: "build-webserver-vm.sh"

end
 


# This sets up a VM for hosting my back end web server.
  config.vm.define "bwebserver" do |bwebserver|
    
# The name of my web server. 
  bwebserver.vm.hostname = "bwebserver"
 
# Portforwarding. 
# This means the host can connect to IP address 127.0.0.1 port 8081, 
#  and that network request will reach our webserver VM's port 80.
     bwebserver.vm.network "forwarded_port", guest: 80, host: 8081, host_ip: "127.0.0.1"

# Set up a private network IP. This will allow VMs to communicate.
     bwebserver.vm.network "private_network", ip: "192.168.2.12"
            
# Sets up permissions for CS labs to access. 
    bwebserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]    

    bwebserver.vm.provision "shell", path: "build-webserver-vm.sh"

end



# Setup VM for hosting database. Should be able to connect my 2 web servers. 
  config.vm.define "dbserver" do |dbserver|
     
# The name of my database server.
     dbserver.vm.hostname = "dbserver"

# Assigns private network IP.
     dbserver.vm.network "private_network", ip: "192.168.2.13"

# Forwarding my dbserver 
     dbserver.vm.network "forwarded_port", guest: 80, host: 3036, host_ip: "127.0.0.1"
  
# Sets up permissions for CS labs to access. 
     dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

# Now we have a section specifying the shell commands to provision
    # the dbserver VM. 
    dbserver.vm.provision "shell", path: "build-dbserver-vm.sh"
      

  end

  
end