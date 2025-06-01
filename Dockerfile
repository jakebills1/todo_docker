# base image
FROM ruby:latest

# update container packages (as root)
# - combining update and install makes sure cache is busted when a new package is listed
# - separate packages by lines
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    nodejs \
    vim

# copy only gemfile
# - caching works top to bottom, this ensures Gems are only rebuilt when Gemfile changes
COPY Gemfile* /usr/src/app/

# set working directory
WORKDIR /usr/src/app


# install project dependencies in working directory
RUN bundle install

# copy rest of source from host to container
COPY . /usr/src/app/

# specify basic command to run server
# - the array syntax makes it so the rails process will receive signals properly
CMD ["bin/rails", "s", "-b", "0.0.0.0"]