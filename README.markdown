Rate My Repo
------------

[![Build Status](https://travis-ci.org/benwoody/ratemyrepo.png?branch=master)](https://travis-ci.org/benwoody/ratemyrepo) [![Code Climate](https://codeclimate.com/github/benwoody/ratemyrepo.png)](https://codeclimate.com/github/benwoody/ratemyrepo)


This is a Rails app to add voting and comments to a users Github repository.

A probably-not-very-current demo can be found @ http://ratemyrepo.herokuapp.com

Running
=======

Install required Gems

    $ bundle

Create and Migrate the database

    $ rake db:create:all && rake db:migrate

You will need to generate a Github application secret and add it to config/github.yml (in the same fashion I have built into config/github.yml.example).

Testing
=======

Install required Gems

    $ bundle

Migrate the database

    $ rake db:test:prepare

I prefer to use guard to keep my tests running.

    $ guard

or just

    $ rspec
