# Simple Ruby BOSH Release

This repo contains files for learning to create a simple BOSH release.

It is intended to be used as part of a training course deployed with a BOSH-Lite director.

## Cloud Config

```sh
git clone https://github.com/cloudfoundry/cf-deployment
cd cf-deployment
git checkout tags/v1.15.0
bosh ucc iaas-support/bosh-lite/cloud-config.yml
cd /path/to/ruby-simple-bosh-release
bosh ucc <(bosh cc) -o custom_load_balancers.yml
```

## Blobs

```sh
touch config/blobs.yml
wget http://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.3.tar.gz
wget https://rubygems.org/rubygems/rubygems-2.7.6.tgz
bosh add-blob ruby-2.4.3.tar.gz ruby/ruby-2.4.3.tar.gz
bosh add-blob rubygems-2.7.6.tgz ruby/rubygems-2.7.6.tgz
```

## Releases

```sh
bosh upload-release https://bosh.io/d/github.com/cloudfoundry-incubator/bpm-release\?v\=0.4.0 --sha1 5a03b988c725c6b5a1aed247c8c23c2bff9d421b

bosh create-release --force && bosh upload-release && bosh -d application deploy manifest.yml
```

## Check

```terminal
$ curl $BOSH_ENVIRONMENT:9090\
Congratulations! You made a BOSH release
```
