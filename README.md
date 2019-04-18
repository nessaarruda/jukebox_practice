# Jukebox Practice Repo

This is a copy of the in-class code-along project called Jukebox.

In this repo you'll find several branches where certain aspects of code are
missing. This provides you with an opportunity to practice building those bits
of functionality.

For example, a branch called "no-routing" may exist where `config/routes.rb`
file is present but empty. You must successfully build the routes necessary to
make your tests pass.

Another example, a branch called "no-model-tests" may exist where your feature
test coverage may be close to 100% but running `rspec spec/models/` tells you
that none of your model methods have unit testing or relationship/validation
testing, etc..

This readme may not exhaustively list all branches available, but the branch
names and failing tests should be descriptive enough to point you in the right
direction. In some cases, this README file will be updated with clues about
what is missing, but you will need to find the resources yourself to correct
the problems presented.

## Using This Repo

1. Fork this repo
2. Clone your fork
3. Check out a branch
4. Fix things
5. Tag your instructors and/or mentors in a pull request for code review

## Branches and Descriptions

#### no-routing

This branch has cleared out almost all branching, so there are lots of failing tests

#### no-model-testing

I've removed some model test files, and much of the structure of other aspects of model testing.

hint: run `rspec spec/models` to see how well you're doing, but that may not notify you of missing things like relationship testing

#### song-creation

Songs are a nested resource under artists. Use TDD to build what you need. Don't forget about sad path testing.

#### artist-creation

Go create some artists. Use TDD.

#### backfill-testing

Lack of tests makes Ian sad. This branch has ZERO testing. Make Ian happy by adding in all testing to get 100% feature and model test coverage.

#### admin-namespacing

Admins can create 'categories' for songs. What do you need to do to add an 'admin' user type?

#### no-auth

Much of the authentication and authorization has been removed. (though not all of it)

#### song-updates

Finish up some CRUD functionality to edit song data in the database.
