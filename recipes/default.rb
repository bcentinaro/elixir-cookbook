#
# Cookbook Name:: elixir
# Recipe:: default
#
# Copyright (C) 2013-2015 Jamie Winsor (<jamie@vialstudios.com>)
#

validate_attributes "elixir"

# Removes source installation before package/source methods were finalized in
# version 0.8.0 of the Elixir cookbook. The install path should always be a
# symlink. If it is not, then delete it and make sure it is.
directory node[:elixir][:install_path] do
  recursive true
  action :delete
  not_if "test -L #{node[:elixir][:install_path]}"
end

directory node[:elixir][:_versions_path] do
  recursive true
end

# node.override['erlang']['esl']['version'] = "19.3"
# include_recipe "erlang::esl"

remote_file '/tmp/esl-erlang_19.3-1~centos~7_amd64.rpm' do
  source 'https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.3-1~centos~7_amd64.rpm'
  mode '0755'
  action :create
end

package 'esl-erlang' do 
  source '/tmp/esl-erlang_19.3-1~centos~7_amd64.rpm'
end


include_recipe "elixir::_#{node[:elixir][:install_method]}"

bin_path    = File.join(node[:elixir][:install_path], "bin")
executables = ["elixir", "elixirc", "iex", "mix"]

executables.each do |executable|
  link "/usr/bin/#{executable}" do
    to File.join(bin_path, executable)
  end
end
