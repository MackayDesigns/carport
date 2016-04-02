#!/bin/bash -e
set -o pipefail

if [ "$TRAVIS_BRANCH" = "master" ] && [ "$TRAVIS_PULL_REQUEST" = "false" ]
then
  git config --global user.email "jeff.mackay@outlook.com"
  git config --global user.name "auto deployer"

  # Stamp index.html with the date and time of PSK's deploying
  date_value=`date`
  sed -i.tmp1 "s/This is another card./This is another card. PSK Deployed on: $date_value/" app/index.html

  deploy_s3 () {
    gulp
  }

  deploy_s3
fi
