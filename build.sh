#!/bin/bash

# Set +x on git_plugin
find ${HOME} -name git_plugin.py -exec chmod -v +x {} \;

# Sync additional plugins defined with Peru
peru sync
