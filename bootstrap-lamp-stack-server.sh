#!/bin/bash

#1. Install REMI and EPEL repositories.

 rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
 rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

 #2. Install Apache Server


 yum --enablerepo=epel,remi install httpd

 #Now start httpd service and enable to start on boot using below commands.

 systemctl start httpd.service
 systemctl enable httpd.service

 #3. MySQL Server
 
 rpm -Uvh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

# Now install MySQL server and other dependency packages.

 yum install mysql-server

 #Apply security on mysql and also set root user password.

 systemctl start mysqld.service
 mysql_secure_installation

 #Now restart MySQL service and enable to start on system boot.

 systemctl restart mysqld.service
 systemctl enable mysqld.service

 #4. Install PHP

#Now install php packages with enabling epel and remi repositories using following command.

 yum --enablerepo=epel,remi install php

 #Now install required php modules. Use following command to list available modules and install it.

 yum --enablerepo=epel,remi list php-*
 yum install php-mysql php-xml php-xmlrpc php-soap php-pgsql php-gd

 #After installing php and other php modules restart Apache service.

 systemctl restart httpd.service

 #5. Open Port in Firewall

 # Install Firewalld and start the service

 yum install firewalld
 sytemctl start firewalld.service
 
#Finally open firewall ports for http (80) and https (443) services using following command.

 firewall-cmd --permanent --zone=public --add-service=http
 firewall-cmd --permanent --zone=public --add-service=https
 firewall-cmd --reload



 
