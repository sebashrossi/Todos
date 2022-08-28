# README
Coding interview developed for Netenders. The application is Todo CRUD based on the requirements.

## Table of Contents

1. [Environment Setup](#environment-setup)
2. [DB](#database)
3. [Testing](#testing)
3. [Linter](#linter)
4. [Demo](#demo)
## Environment Setup

This application is using:
* Ruby version 3.0.2
* Rails 6.1.6.1

In your terminal, run the following to clone the project onto your local machine:

#### HTTPS
```
git clone https://github.com/sebashrossi/Todos.git
```
#### SSH
```
git clone git@github.com:sebashrossi/Todos.git
```

For the final setup for the packages, gems, remotes, and prepping databases run the following:
```
bin/setup
```
Finally, to run the server:
```
rails server
```
## Database
This project uses PostgreSQL as database.

## Testing
This project uses Rspec as test framework.

To run the test suite run:
```
bundle exec rspec
```

## Linter
This project uses Rubocop as linter.
See config [here](./.rubocop.yml)

## Demo
Working demo has been uploaded to Heroku.
[Todos Demo](https://netenderstodos.herokuapp.com)
