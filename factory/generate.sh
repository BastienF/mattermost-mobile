#! /bin/bash
cd /mattermost-mobile/
cd fastlane
bundle install
cd ..
make pre-run
make SHELL='sh -x' build-android
