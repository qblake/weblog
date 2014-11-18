# Weblog
[![Build Status](https://travis-ci.org/qblake/weblog.png)](https://travis-ci.org/qblake/weblog)
[![Coverage Status](https://coveralls.io/repos/qblake/weblog/badge.png)](https://coveralls.io/r/qblake/weblog)
[![Code Climate](https://codeclimate.com/github/qblake/weblog.png)](https://codeclimate.com/github/qblake/weblog)
[![endorse](https://api.coderwall.com/qblake/endorsecount.png)](https://coderwall.com/qblake)

[![Build Status](https://snap-ci.com/ltHKQjV1YwsgPF_rDJySuM5wxaWvBxNpH_9dkrWpc7I/build_image)](https://snap-ci.com/projects/qblake/weblog/build_history)

## How to run this app.

### Prepare

1. Install VirualBox (https://www.virtualbox.org/wiki/Downloads)
2. Install vagrant (http://www.vagrantup.com/downloads.html)

### Run

0. go to dir with this project.
1. run `vagrunt up`.
Wait until box will be downloaded from server.
Wait.
2. run `vagrant ssh`
3. run `cd /weblog`
4. run `bundle`
5. run `rake db:create db:migrate`
6. run `rails s`
7. open http://localhost:3000 in browser

## Links

1. http://rusrails.ru/getting-started-with-rails

## Contributing

see [CONTRIBUTING.md](CONTRIBUTING.md)
