# Alf - My Aliases made originally in alf (for bash)

## Commands

### `all-groups`

Get all groups (this doesn't work on Windows)

### `cdp`

Go to projects directory (Originally it went to ~/Projects currently it goes to ~/go/src)

### `c`

Go to specified directory, clear scren and show new location

### `compare-dir`

Compare directories specified by arguments

TODO: This could not work on Windows because of convience aliases which is mapped to diff

### `count`

Count how many files and directories are in specified directory

### `cm`

Chmod

### `cmr`

Chmod recursively

### `co`

Chown

### `cor`

Chown recursively

### `d`

Docker

#### `psf`

List containers with ports

#### `paf`

List containers with ids

#### `p`

List containers

#### `clean`

Prune docker

#### `deploy`

Docker stack deploy

#### `i` / `images`

List images

#### `n`

docker network $args

#### `rmi`

Remove image

#### `rmv`

Remove volume

#### `v`

docker volume $args

#### `r`

docker run -it --rm $args

#### `replicas`

docker service ls with format that show replicas


#### `s`

docker service $args

#### `st`

docker stack $args

#### `size`

Show docker images size

#### `stats`

Show docker stats with CPU usage and Memory usage

#### `<other>`

Other commands are forwarded to docker cli

### `dc`

docker-compose

#### `ud`

Start containers using docker-compose to detached state

#### `ub`

Build and start containers using docker-compose to detached state

#### `ur`

Recreate and start containers using docker-compose to detached state

#### `ubr`

Force recreate, rebuild and start containers using docker-compose to detached state

#### `u`

Start containers using docker-compose in attached state

#### `eb`

Start bash shell in $1 container

#### `e`

docker-compose exec $1 $rest_args

#### `rb`

Run bash in specified container (this creates new run container)

#### `r`

Run $rest_args in specified container (this creates new run container)

#### `d`

Stop services and remove them using docker-compose (docker compose down)

#### `sael`

Show /var/log/apache2/error.log in specified $1 container

#### `stael`

Attach to /var/log/apache2/error.log in specified $1 container

#### `lf`

Attach to logs of docker-compose containers

#### `<other>`

Other commands are forwarded to docker-compose

### `dclf`

docker-compose logs -f

### `dfh`

Show list of filesystems with available size (Should be similiar to `df -h` from linux but using PowerShell)

### `dfhd`

Same as `dfh` though ignoring tmpfs and udev

### `duh`

Get disk usage of specified directory or current directory if none is specified

### `dps`

docker ps

### `dpsa`

docker ps -a

### `gg`

git push

### `ggt`

git push && git push --tag $args

### `gpl`

git pull

### `killport`

Try to find and kill process that is using specified port

### `l`

List current directory

### `le`

List current directory using exa

### `env`

List environment variables

### `nv <pattern>`

List environment variables that match pattern

### `psf <pattern>`

List processes that match pattern

### `repeat <number> {<script>}`

Repeat specified script $number times

### `r` / `r {<script>}`

Clear screen and then run specified script

### `ih`

Invoke-History cmdlet

### `title <title>`

Change title of terminal

### `update`

Update system

### `superlinter`

Update superlinter image and run superlinter image

### `ver`

Show OS version

### `p <args>`

Run PWBS

### `n`

Run neovim

### `nn`

Run neovide

### `loop_infinite {<script>}`

Run specified script infinitely

### `which_package <command>`

Check which package installs specified command.
Works only in linux using dpkg.

### `w`

Starts watcher

#### `dfh`

Starts watcher with dfh

#### `odc-ps`

Starts watcher with op dc ps

#### `dc-ps`

Starts watcher with dc ps

#### `ls`

Starts watcher with ls

#### `<other>`

Starts watcher with specified scriptblock
