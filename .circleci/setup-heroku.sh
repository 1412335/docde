#!/bin/bash
# set -eu
# git remote add heroku https://git.heroku.com/$HEROKU_APP_NAME.git
# wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
# cat > ~/.netrc << EOF
# machine api.heroku.com
# login $HEROKU_LOGIN
# password $HEROKU_API_KEY
# machine git.heroku.com
# login $HEROKU_LOGIN
# password $HEROKU_API_KEY
# EOF
# chmod 600 ~/.netrc

ssh-keyscan -H heroku.com >> ~/.ssh/known_hosts
# If you need access to the heroku CLI to run heroku commands in the deploy step add these lines:
# mkdir -p /usr/local/lib /usr/local/bin
# tar -xvzf heroku-linux-amd64.tar.gz -C /usr/local/lib
# ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku

cat > ~/.netrc << EOF
machine api.heroku.com
login $HEROKU_LOGIN
password $HEROKU_API_KEY
machine git.heroku.com
login $HEROKU_LOGIN
password $HEROKU_API_KEY
EOF

cat >> ~/.ssh/config << EOF
VerifyHostKeyDNS yes
StrictHostKeyChecking no
EOF