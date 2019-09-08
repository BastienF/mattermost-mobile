#! /bin/bash
export NODE_OPTIONS="--max_old_space_size=6000"
cd /mattermost-mobile/
cd fastlane
bundle install
cd ..
make pre-run
make SHELL='sh -x' build-android
