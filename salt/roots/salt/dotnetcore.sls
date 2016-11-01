#steps taken from https://www.microsoft.com/net/core#ubuntu
{% if grains['osfullname'] == 'Ubuntu' %}
dotnetdev_repo:
  pkgrepo.managed:
    - humanname: .Net Core Dev
    - name: deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main
    - dist: trusty
    - file: /etc/apt/sources.list.d/dotnetdev.list
    - keyid: 417A0893
    - keyserver: apt-mo.trafficmanager.net

dotnetdev_installed:
  pkg.installed:
    - name: dotnet-dev-1.0.0-preview2.1-003155
{% elif grains['os_family'] == 'Windows' %}
  chocolatey.installed:
    - name: dotnetcore-sdk
    - package_args: -pre
{% endif %}
