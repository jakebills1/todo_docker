# README
## Setup
Add the following files to the project root:
.env/development/web
```text
DATABASE_HOST=database
REDIS_URL=redis://redis:6379
```
.env/development/database
```text
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=todo_development
```
Install and configure Docker and Docker Compose on your [machine](https://docs.docker.com/get-started/get-docker/).
## Build and Run
### using Docker
```bash
# build
$ docker build .
# run server
$ docker run -p 3000:3000 <container id or name>
# non-default command, eg show rake tasks
$ docker run --rm <container id or name> bin/bails -T
```

### using Docker compose
#### managing web
```bash
# start in background
$ docker compose up -d
# start, stop, restart a service
$ docker compose stop web
$ docker compose start web
$ docker compose restart web
# view logs
$ docker compose logs -f web
# one-off commands, eg. migrations
# - can run in an ephemeral container or attach to running one
$ docker compose run --rm web bin/rails db:migrate
$ docker compose exec web bin/rails db:migrate
# container management
# rebuild a service
$ docker compose build web
# stop and remove containers, network, and volume]
$ docker compose down
# remove containers only
$ docker compose rm
# add dependencies
$ docker compose exec web bundle add some_gem
```
#### managing redis
```bash
# managing other services
$ docker compose up -d redis
# start up ephemeral container running redis-cli connected to redis host
# - "redis" is a host name within DNS settings of container / network
$ docker compose run --rm redis redis-cli -h redis
```
#### managing database
```bash
# starting
$ docker compose up -d database
# viewing logs
$ docker compose logs database
# connecting via ephemeral container
$ docker compose run --rm database psql -U postgres -h database
```
#### testing
```bash
$ docker-compose exec web bin/rails spec
```
## Use
Visit http://localhost:3000 