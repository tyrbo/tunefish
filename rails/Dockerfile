#
# Dockerfile for running tunefish in production
#
# https://github.com/tyrbo/tunefish/tree/master/rails
#

# Pull base image.
FROM tyrbo/ruby-2.1.4

# Switch to root
USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libpq-dev libreadline-dev

# Install bundler
RUN gem install bundler

# Make directory and chown it.
RUN mkdir -p /ruby/tunefish
RUN chown ruby:ruby /ruby/tunefish

# Set the working directory
WORKDIR /ruby/tunefish

# Add Gemfile and Gemfile.lock
ADD Gemfile /ruby/tunefish/Gemfile
ADD Gemfile.lock /ruby/tunefish/Gemfile.lock
RUN chown ruby:ruby /ruby/tunefish/Gemfile /ruby/tunefish/Gemfile.lock

# User ruby
USER ruby

# Bundle to install
RUN bundle install --without development test

# To root
USER root

# Add our project to image
ADD ./ /ruby/tunefish

# Make all files ours
RUN chown -R ruby:ruby /ruby/tunefish

# Back to ruby
USER ruby

CMD ["bash"]
