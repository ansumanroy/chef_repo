#
# Cookbook:: custom_nginx
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#

#begin
#	  infraprop = Chef::DataBagItem.load( 'infraprop1', 'rel1' )
#rescue
#	  Chef::Log.fatal("Could not find the 'rel1' item in the 'infraprop1' data bag - Raising fatal error!!")
#	    raise
#end

package "nginx"

cookbook_file "/tmp/index.html" do
   source 'default/httpd.conf'
   action :create
end

service "nginx" do
	  action [:enable, :start]
end

#infraprop = data_bag('infraprop')
#puts data_bag_item[opatch::rel1]

template '/tmp/dotproperty.properties' do
	  source 'dotproperty.properties.erb'
	  variables(
		  :name => data_bag_item('opatch','rel1','name'),
		  :age => data_bag_item('opatch','rel1','age')
	  )

end

cookbook_file "/tmp/executor.sh" do
	source 'default/executethis.sh'
	mode '0755'
	action :create
end

execute 'Execute my script' do 
	 cwd     '/tmp'
	 command './executor.sh'
end

