# dotnetcore-vagrant
A playground for setting up .Net core on windows and linux

# Props to Scott Hanselman
I followed [this post](http://www.hanselman.com/blog/PublishingAnASPNETCoreWebsiteToACheapLinuxVMHost.aspx) to set things up on linux.

# Setup
- install VirtualBox 5.1.8 
- install Vagrant 1.8.6.
- open a command prompt
- git clone https://github.com/daveneeley/dotnetcore-vagrant
- cd dotnetcore-vagrant
- vagrant up

Note the windows image is 3GB and may take some time to download. On my less-than-developer-class PC I also ran into timeout issues with the windows VM, but it did start eventually. YMMV.


