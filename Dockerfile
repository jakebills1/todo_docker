# base image
FROM ruby:latest

# update container packages (as root)
# - combining update and install makes sure cache is busted when a new package is listed
# - separate packages by lines
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    curl \
    gnupg

# install latest node from deb
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

# get latest npm version
RUN npm install -g npm@latest

# check node version
RUN node --version
# check npm version
RUN npm --version

# copy only gemfile and package.json first
# - caching works top to bottom, this ensures Gems are only rebuilt when Gemfile changes
COPY Gemfile* /usr/src/app/
COPY package.json package-lock.json* ./

# set working directory
WORKDIR /usr/src/app

# use for more granular caching of gems
ENV BUNDLE_PATH /gems

# install project dependencies in working directory
RUN bundle install

# install react dependencies (needs to be in working directory)
RUN npm install \
    react \
    react-dom \
    @babel/preset-react \
    css-loader \
    style-loader \
    mini-css-extract-plugin \
    css-minimizer-webpack-plugin

RUN npm ci && npm cache clean --force

# copy rest of source from host to container
COPY . /usr/src/app/

# specify basic command to run server
# - the array syntax makes it so the rails process will receive signals properly
CMD ["bin/rails", "s", "-b", "0.0.0.0"]