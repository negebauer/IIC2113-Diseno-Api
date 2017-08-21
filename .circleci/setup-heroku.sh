#!/bin/bash
url='iic2113-api'
if [[ $1 != 'master' ]]; then
  url="${url}-staging"
fi

git remote add heroku https://git.heroku.com/$url.git
wget https://cli-assets.heroku.com/branches/stable/heroku-linux-amd64.tar.gz
mkdir -p /usr/local/lib /usr/local/bin
sudo tar -xvzf heroku-linux-amd64.tar.gz -C /usr/local/lib
ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku

  cat > ~/.netrc << EOF
  machine api.heroku.com
    login $HEROKU_LOGIN
    password $HEROKU_API_KEY
  machine git.heroku.com
    login $HEROKU_LOGIN
    password $HEROKU_API_KEY
  EOF

# Add heroku.com to the list of known hosts
ssh-keyscan -H heroku.com >> ~/.ssh/known_hosts
