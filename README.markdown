Rate My Repo
------------

This is a Rails app to add voting and comments to a users Github repository.

Running
=======

Install required Gems

    $ bundle

Migrate the database

    $ rake db:migrate

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

To Do
=====

* A signed in User should be able to leave a comment on a Repo
* A signed in User should be able to rate a Repo 1 time
