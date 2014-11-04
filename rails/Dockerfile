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
    apt-get install -y libpq-dev

# Add our project to image
ADD ./ /ruby/tunefish

# And make it ours
RUN chown -R ruby:ruby /ruby/tunefish

# User ruby
USER ruby

# Set the working directory
WORKDIR /ruby/tunefish

# Install bundler
RUN gem install bundler

# Bundle to install
RUN bundle install --without development test

CMD ["bash"]
