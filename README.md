# elixir-cookbook

A cookbook to manage an installation of [Elixir](http://elixir-lang.org/).

## Supported Platforms

* CentOS
* Amazon Linux 

## Attributes

- `node['elixir']['install_path']` - Path that Elixir will reside in (Default: /usr/local/lib/elixir)
- `node['elixir']['install_method']` - Method of installation: "package" or "source" (Default: "package")
- `node['elixir']['version']` - Version of Elixir to install (Default: 1.3.0)


## Recipes 

### elixir::default

This will install Elixir and Erlang on the node. By default, Elixir and Erlang will be installed from packages. If you want to install from source you can set the `node[:elixir][:install_method]` attribute.

## License and Authors

Authors
* Jamie Winsor (<jamie@vialstudios.com>) [Original Cookbook](https://github.com/reset/elixir-cookbook)
* Bill Centinaro (<bill@centinaro.net>)
