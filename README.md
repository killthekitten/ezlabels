# Ezlabels

Ezlabels is an Open Source tool that solves the task of labeling a custom dataset quickly, efficiently and privately. It is designed for installation on your local machine or your own servers and to be accessed by multiple users simultaneously within one or more markup projects.

The basic flow that is implemented right now is built around the task of tagging an image dataset (you can define desired classes) and accepting or rejecting images (binary classification). We plan on making this process easily extendable in Rails fashion, with custom engines and gems.

## What's implemented and what's planned

- [x] Multiple users
- [x] Multiple projects
- [x] Multiple users can work on the same project (each one works on their own part)
- [x] Deploy process
- [x] Image tagging
- [x] Image binary classification
- [x] Hotkeys
- [x] Simple charts
- [ ] Export/import as CSV (currently you can only manipulate data via `psql` or `rails console`) (#9 and #8)
- [ ] Engines for text and video labeling, object detection and background segmentation
- [ ] REST API for bots and pluggable services (#20)
- [ ] Data comments (#19)
- [ ] Data flows (i.e. take a subset of an existing dataset and create an independent project with it) (#18)
- [ ] S3/AWS integration (#10)
- [ ] Role model and project visibility

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

| Variable Name         | Description                                                            |
| --------------------- | ---------------------------------------------------------------------- |
| DATABASE_URL          | `postgres://postgres:postgres@localhost/ezlabels_development`          |
| CAP_APP_NAME          | App name one the server (i.e. folder name at `/var/www/`)              |
| CAP_REPO_URL          | Where to pull the repo from to the server                              |
| DEVISE_SECRET         | Salt for Devise ruby gem (your user passwords will be created with it) |

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
