#!/usr/bin/env bas
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

chmod a+x bin/rails db:migrate