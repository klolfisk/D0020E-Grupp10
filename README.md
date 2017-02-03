# README

This README would normally document whatever steps are necessary to get the
application up and running.

Itemes needed to use this:
Ruby on rails - https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm
Linux distro inside a virtual machine (using ubuntu 16.10 during this project) - http://www.psychocats.net/ubuntu/virtualbox
Install Docker on your linux distro - https://docs.docker.com/engine/installation/linux/ubuntu/

Steps to do:
1. Enable dockers remote API - https://www.ivankrizsan.se/2016/05/18/enabling-docker-remote-api-on-ubuntu-16-04/
2. Have ruby installed on your VM - Is this even needed?
3. Clone this branch
4. Change the Docker.url line in the container controller to use the IP for your docker remote api. This is most likely Docker.url = 'tcp://localhost:4243' 

