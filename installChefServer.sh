#!/bin/bash
sudo hostname 'test.testdomain.com'
echo "###########################################"
echo "Download Chef to /tmp/chef-installers"
sudo mkdir -p /tmp/chef-installers
sudo mkdir -p ~/.chef
sudo cd /tmp/chef-installers
echo "###########################################"
echo "Wget Chef"
wget https://packages.chef.io/files/stable/chef-server/12.19.31/el/7/chef-server-core-12.19.31-1.el7.x86_64.rpm
sudo chmod 755 *
echo "###########################################"
echo "Installing RPM"
sudo rpm -Uvh chef-server-core-12.19.31-1.el7.x86_64.rpm
echo "###########################################"
echo "Reconfiguring Chef Server CTL"
sudo chef-server-ctl reconfigure

echo "###########################################"
echo "Creating User Chef Admin"
sudo chef-server-ctl user-create chef_admin Chef Admin chef_admin@chef.com 'Welcome99$' --filename ~/.chef/chef_admin.pem
echo "###########################################"
echo "Chef PEM file generated now uploading to S3"
echo "###########################################"
echo "contents of Chef Admin PEM file"
sudo cat ~/.chef/chef_admin.pem

echo "###########################################"
echo "contents of Chef Admin PEM file"
sudo chef-server-ctl org-create OCDNAB 'Origination & Credit Decisioning' --association_user chef_admin --filename ~/.chef/ocdnab-validator.pem
sudo chef-server-ctl install chef-manage
sudo chef-server-ctl reconfigure
sudo chef-manage-ctl reconfigure --accept-license

