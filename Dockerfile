# base image
FROM ruby:latest

# update container packages (as root)
RUN apt-get update -yqq
# RUN apt-get isntall -yqq --no-install-recommends nodejs

# copy source from host to container
COPY . /usr/src/app/

# set working directory
WORKDIR /usr/src/app

# install project dependencies in working directory
RUN bundle install

# specify basic command to run server
# - the array syntax makes it so the rails process will receive signals properly
CMD ["bin/rails", "s", "-b", "0.0.0.0"]