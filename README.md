# docker-vagrant-python

Docker containers tuned to run by Vagrant without a big amount of buzz.

Basically it is just an extension of [docker-vagrant](https://github.com/9seconds/docker-vagrant)
for those who wants to have Python installed.

It provides you with a big set of different Pythons (from 2.3 to 3.4).
`2.6`, `2.7`, `3.1`, `3.2`, `3.3`, `3.4` are coming with PIP, setuptools and virtualenv
preinstalled.

## Installation

Basically you may fetch these VMs from Docker Hub:

```shell
$ docker pull nineseconds/docker-vagrant-python
```

or if you want Python 2.7:

```shell
$ docker pull nineseconds/docker-vagrant-python:2.7
```

Or if you want, you may build them manually with `Makefile` (just run `make`
and get the same images as I have).

## Usage

Usage is straighforward: please check `Vagrantfile` in the repository. Minimal
`Vagrantfile` is following:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Vagrant uses vagrant user by default. Docker uses root. Use root, it is
  # a development environment anyway.
  config.ssh.username = "root"

  config.vm.provider "docker" do |docker|
      # The name of the image to use
      docker.image = "nineseconds/docker-vagrant-python:3.4"

      # vagrant docker images have SSH so why not to use it
      docker.has_ssh = true

      # Yes, containers are long running.
      docker.remains_running = true
  end
end
```

Please check documentation on [docker-vagrant](https://github.com/9seconds/docker-vagrant) to get more.
