FROM ruby:2.6

LABEL Name=survey Version=0.0.1

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Install gems: it's better to build an independent layer for the gems
# so they are cached during builds unless Gemfile changes WORKDIR /tmp

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

WORKDIR /app
COPY . /app

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-s", "puma", "--host", "0.0.0.0"]
