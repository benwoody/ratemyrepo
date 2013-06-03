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

To Do For RC1
=============

### Homepage

* What Items should be visible?
** Top Repos (based on Language?)
** Newest Comments
** Newest Repos
** Top Rated Developers (based on Language?)

### Repos

* Fetch info for Repo
** Last Commit Date
** Number of Commits
** Number of Open Issues/Pull Requests
** Stars
** Forks

* Rating algo

### Settings

Make Repo/User tabs Ajaxy

#### Repo

* Turn Repo visibility on/off with toggle

#### User

* Make email public/private

To Do Sprint 2
==============

### Email

* Email ammount (Weekly updates, Daily Updates, Every new Rating)
* User messaging
 
### Search

* by Tag
* by Language
* by Owner
* by Name/Keyword

* sort by Rating
* sort by Number of Comments
* sort by Last Updated (Last commit date)
