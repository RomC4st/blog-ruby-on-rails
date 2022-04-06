# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Install with script

```
   sh bin/install-dev.sh
```

# Install with docker

```
   docker cmpose up
```

# DB migration and seeds with Docker

```
    docker-compose run --rm web rake db:seed
    docker-compose run --rm web bin/rails db:migrate RAILS_ENV=development
```

Create .env file ( see .env.example)