#!/bin/bash

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt -y install jq git file nodejs build-essential
sudo npm install -g gitbook-cli

gitbook init
gitbook install
gitbook build

TARGET_DIR=_wiki_wmsxwd_com

git clone "https://github.com/wmsxwdwiki/wmsxwdwiki.github.io.git" ${TARGET_DIR}

rm -rf ${TARGET_DIR}/*
cp -r ./_book/* ${TARGET_DIR}/
#cp CNAME ${TARGET_DIR}/
#cp robots.txt ${TARGET_DIR}/
#cp -r ./resources/* ${TARGET_DIR}/resources/

pushd ${TARGET_DIR}
git config user.name "Jokns"
git config user.email "jokns@wmsxwd.com"

git add -A
git commit -m 'update'
git push "https://${SUPER_TOKEN}@github.com/wmsxwdwiki/wmsxwdwiki.github.io.git" master
popd
