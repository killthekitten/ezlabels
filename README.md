# Ezlabels


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

## Basic setup
```
bundle install
bundle exec rake db:setup
```
