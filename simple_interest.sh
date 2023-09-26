#!/usr/bin/env bash
set -e

GITHUB_TOKEN=<my_token>
REPO="kevholditch/demo"
FILE="demo_0.0.1_linux_amd64.tar.gz"
VERSION="v0.0.1"                    

wget -q --auth-no-challenge --header='Accept:application/octet-stream' \
  https://$GITHUB_TOKEN:@api.github.com/repos/$REPO/releases/assets/`curl -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3.raw"  -s https://api.github.com/repos/$REPO/releases | jq ". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"` \
  -O /tmp/$FILE
