#!/bin/bash

_CURR_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
rm -rf $_CURR_DIR/gh-pages $_CURR_DIR/.cache

#antora --pull --stacktrace  site.yml

podman run -v $PWD:/antora:Z --rm -it antora/antora antora generate --stacktrace site.yml
podman run -v ./gh-pages/:/var/www/html/:Z --rm -it -p 3000:8080 registry.access.redhat.com/rhscl/httpd-24-rhel7