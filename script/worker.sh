#!/bin/bash

#
# Prevent having to restart Foreman if any of the workers crash during development,
# such as if there is a syntax error in the code during development.
#
while true; do
    bundle exec rake jobs:work
    echo 'Job worker quit... restarting in 5s'
    sleep 5
done
