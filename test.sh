#/usr/bin/env/sh
set -e

echo "Testing Rails"
cd rails
bundle install
rake db:create db:migrate
rake
cd ..

echo "Testing Ember"
cd ember
npm install -g bower
npm install
bower install
npm test
cd ..
