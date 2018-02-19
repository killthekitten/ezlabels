# Ezlabels

## Prerequisites

You should have Ruby and PostgreSQL installed locally. The easiest way to do this depends on your OS and your taste.

The recommended way to deal with Ruby is via [rbenv](https://github.com/rbenv/rbenv). Don't forget to install [ruby-build](https://github.com/rbenv/ruby-build).

This will show you the required ruby version:

```
cat .ruby-version
```

### PostgreSQL: macOS

The easiest way to install is via [Postgres App](https://postgresapp.com/).

### PostgreSQL: Linux

There are more choices for Linux, but this one usually works well:

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04


## Configuration

The app follows the https://12factor.net/ guidelines. All configuration can be done via env variables ([dotenv](https://github.com/bkeepers/dotenv) is responsible for that). 

First, copy the configuration file sample:

```
cp .env.example .env
```

Second, edit it with your editor of choice:

```
nano .env
```

The variable names are self-descriptive, but you are especially interested in `DATABASE_URL` (more on how it works you can find in [this section of Rails Guidelines](http://edgeguides.rubyonrails.org/configuring.html#configuring-a-database)).

### Environment Variables

| Variable Name         | Description                                                    |
| --------------------- | -------------------------------------------------------------- |
| DATABASE_URL          | `postgres://postgres:postgres@localhost/ezlabels_development`  |
| BASIC_AUTH_NAME       | Basic Auth Username (required, TODO: Remove entirely)          |
| BASIC_AUTH_PASSWORD   | Basic Auth Password                                            |
| CAP_APP_NAME          | App name one the server (i.e. folder name at `/var/www/`)      |
| CAP_REPO_URL          | Where to pull the repo from to the server                      |
| DEVISE_SECRET         | Salt for Devise ruby gem (you user passwords)                  |

## Basic setup

```
bundle install
bundle exec rake db:setup
```

## TODO: Provisioning

This will do for now:

https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-puma-and-nginx-on-ubuntu-14-04

We're waiting for someone smart to submit a Pull Request with Docker or Ansible workflow.

## Deploy

Deploy is done via [Capistrano](http://capistranorb.com/). If you're a fan of [Heroku](https://heroku.com), it is probably going to work as is.

### Configuration

Change `CAP_APP_NAME` and `CAP_REPO_URL` in `.env` to those you want to use.

Then, setup the remote directory structure:

```
bundle exec cap production deploy initial
bundle exec cap production puma:nginx_config
```

### Deploy

```
bundle exec cap production deploy
```
