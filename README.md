# README

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
```

## Use
Visit http://localhost:3000 