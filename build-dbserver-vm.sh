# Update Ubuntu software packages.
	 apt-get update
     #apt-get upgrade -y

# We create a shell variable MYSQL_PWD that contains the MySQL root password
     export MYSQL_PWD='password123'

# Give the password to the installer so that we don't get asked for password.
     echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections 
     echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

# Install the MySQL database server.
     apt-get -y install mysql-server

# Run some setup commands to get the database ready to use.
      # First create a database.       
     echo "CREATE DATABASE testdb;" | mysql
    
# Create a database user "admin" with the given password, "admin".
     echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'password123';" | mysql

# Provide all privilieges to the admin user.
     echo "GRANT ALL PRIVILEGES ON testdb.* TO 'admin'@'%'" | mysql      
       
# Set the MYSQL_PWD shell variable that the mysql command will
      # try to use as the database password ...
     export MYSQL_PWD='password123'       

# ... and run all of the SQL within the setup-database.sql file,
      # which is part of the repository containing this Vagrantfile, so you
      # can look at the file on your host.
     cat /vagrant/setup-database.sql | mysql -u admin testdb
       
# By default, MySQL only listens for local network requests,
      # i.e., that originate from within the dbserver VM. We need to
      # change this so that the webserver VM can connect to the
      # database on the dbserver VM.
     sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf       

# We then restart the MySQL server to make changes.
service mysql restart
     SHELL