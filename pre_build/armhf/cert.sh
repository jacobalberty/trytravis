#!/usr/bin/env bash

/etc/ssl/certs/java/cacerts 2> /dev/null; update-ca-certificates -f

c_rehash
