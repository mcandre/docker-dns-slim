# docker-dns-slim - a slim Docker container for a DNS server

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-dns-slim/

# ABOUT

docker-dns-slim is a container for a DNS server, made smaller with a few techniques.

* Replace [ubuntu](https://registry.hub.docker.com/_/ubuntu/) with [progrium/busybox](https://registry.hub.docker.com/u/progrium/busybox/).
* Replace [BIND](https://www.isc.org/downloads/bind/) with [NSD](http://www.nlnetlabs.nl/projects/nsd/).

# EXAMPLE

```
$ make
docker exec 929928dcaae681eb647968b1b7f76f1dc4d15b27ea7960035226313b5cda5d47 nsd-checkconf /etc/nsd3/nsd.conf
dig @$(boot2docker ip) www.google.com +trace

; <<>> DiG 9.8.3-P1 <<>> @192.168.59.103 www.google.com +trace
; (1 server found)
;; global options: +cmd
;; Received 17 bytes from 192.168.59.103#53(192.168.59.103) in 3 ms

dig @$(boot2docker ip) www.sneaky.net +noall +authority

; <<>> DiG 9.8.3-P1 <<>> @192.168.59.103 www.sneaky.net +noall +authority
; (1 server found)
;; global options: +cmd
dig @$(boot2docker ip) -x 3.141.59.26 +noall +authority

; <<>> DiG 9.8.3-P1 <<>> @192.168.59.103 -x 3.141.59.26 +noall +authority
; (1 server found)
;; global options: +cmd
docker images | grep mcandre/docker-dns-slim | awk '{ print $(NF-1), $NF }'
7.463 MB
```

# ABOUT

docker-dns-slim is an example Docker container for a caching DNS resolver and master DNS authority.

# REQUIREMENTS

* [Docker](https://www.docker.com/)
* [dig](http://man.cx/dig)

## Optional

* [make](http://www.gnu.org/software/make/)

## Debian/Ubuntu

```
$ sudo apt-get install docker.io build-essential dnsutils
```

## RedHat/Fedora/CentOS

```
$ sudo yum install docker-io bind-utils
```

## non-Linux

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [boot2docker](http://boot2docker.io/)

### Mac OS X

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
* [Homebrew](http://brew.sh/)
* [brew-cask](http://caskroom.io/)

```
$ brew cask install virtualbox vagrant
$ brew install boot2docker
```

### Windows

* [Chocolatey](https://chocolatey.org/)

```
> chocolatey install docker bind-toolsonly make
```
