# README

```bash
# build
$ docker build .
# run server
$ docker run -p 3000:3000 <container id or name>
# non-default command, eg show rake tasks
$ docker run --rm <container id or name> bin/bails -T
```
Visit http://localhost:3000 