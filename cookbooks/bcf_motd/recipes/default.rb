#
# Cookbook:: bcf_motd
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved
#node.force_override['ipaddress'] = '127.0.0.1'
#node.normal['catch_phrase'] = 'Welcome to the kitchen'
#node.force_default['catch_phrase'] = 'Cooking with Gas!'

file "/etc/motd" do
	content "IP Address: #{node['ipaddress']}
Catch Phrase: #{node['catch_phrase']}
"
end
