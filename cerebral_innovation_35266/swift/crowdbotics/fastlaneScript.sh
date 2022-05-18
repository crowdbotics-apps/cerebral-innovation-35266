#!/bin/bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export FASTLANE_PASSWORD=Genghis109
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH=$PATH:/usr/local/git/bin:/usr/local/bin

/Library/Ruby/Gems/2.3.0/gems/fastlane-2.90.0/bin/fastlane do_everything