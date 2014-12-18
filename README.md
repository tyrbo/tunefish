TuneFish
========

TuneFish is a social media music aggregator currently based around three providers: SoundCloud, YouTube, and Twitter.  Using the OAuth2 protocol you can authenticate with each service, and TuneFish will search for new music and populate an activity feed.  Videos and tracks are embedded directly into the TuneFish interface, meaning you won't have to open new tabs to listen to tracks.

##### With TuneFish you can:

* View your own activity feed
* Manage what social media accounts you'd like to track
* Filter by provider
* Browse other users and see their feeds
* Subscribe to users and a separate activity feed will be filled with aggregated content

Some specifics based on provider:

* **Twitter** - TuneFish looks for tweets with the hashtag #tf.  If you find a song you like and want to share it with your followers, add the hashtag and we'll add that tweet directly to your activity feed.
* **YouTube** - After you authenticate with your Google account, you'll have the option to whitelist certain subscriptions that will be pulled into your feed.  
* **SoundCloud** - TuneFish looks for your favorited tracks.

## Technical stuffs

TuneFish is an Ember/Rails application.  The back end uses [Redis](http://redis.io/) and [Sidekiq](https://github.com/mperham/sidekiq), with workers making 3rd party HTTP requests and saving new activity to the database.  All three services have excellent support for embedded content, so we're typically requesting track or video ids which we can plug into our Ember templates based on provider.

## Major Features/Screenshots

#### Landing Page

![landing page](http://i.imgur.com/1hsQKmy.png)

New users will land here with the option to login via OAuth.

#### Main Activity Feeds

![activity feed](http://i.imgur.com/GVlHJ6d.png)

Here is the main activity feed.  On the left you'll have the option to add new services or manage existing services.  Here is where you can whitelist YouTube subscriptions, adding and removing subscriptions can be done at any time.  Filtering by provider is also available.  The two tabs at the top of the page allow you to switch between your own feed and the compiled feeds of users you currently follow.

#### Browsing Other User's Feeds

![user show](http://i.imgur.com/9p0wXJl.png)

TuneFish has an internal user subscription system, which allows you to browse other site users and see what kind of content pops up on their feeds.

## Installation

TuneFish is an Ember/Rails application, and you'll need to run both servers side by side.

For Ember you will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM) and [Bower](http://bower.io/)

On the Rails side you'll need [Redis](redis.io) and [Sidekiq](https://github.com/mperham/sidekiq).

```
git@github.com:tyrbo/tunefish.git

cd tunefish
# from here you'll have two folders (ember/rails) which contain each application respectively

# Rails
cd rails
bundle
rake db:create db:migrate db:seed

# To run redis/sidekiq (you'll need to leave both procceses running)
redis-server
sidekiq

# Running the rails server
bundle exec rails server

# Ember

npm install
bower install

# Running the Ember server
ember server -proxy http://localhost:3000 # or whatever port you plan on running the Rails server
```

At this point you can point your browser to `http://localhost:4200` and everything should be running smoothly.

### Ember Tests

* `ember test`
* `ember test --server`

### Build Ember

* `ember build` (development)
* `ember build --environment production` (production)
