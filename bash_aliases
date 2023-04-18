#!/usr/bin/env bash

################# faster directory nav (I don't like to type ../ very often :D) #################
# up one
alias ..='cd ../'

# up two
alias ...='cd ../../'

# up three
alias ....='cd ../../../'


################# docker commands aliases, because why not use Docker!? #################

# list all running and stopped containers
alias dkpa='docker ps -a'

# start all containers from the docker-compose.yml file, the location of the file 
# has to be present in the base path of the command though
alias dkup='docker-compose up'

# If for up, then also one for down
alias dkdw='docker-compose down'

# pruning after docker-compose down, useful to freeup space as space ain't free all the time
alias dkpr='docker system prune -f'

# stop running container, after system prune mostly remote helpers are running, 
# required container sub-hash or name
alias dkst='docker stop'

# remove a container after stopped, needs container sub-hash or name
alias dkrm='docker rm'

# list all docker images built
alias dkimg='docker images'

# list all docker volumes
alias dkvol='docker volume ls'

# adding one for removing image as I run remote debuggers from time to time, expects the image with
# tag information
alias dkrmi='docker rmi'

################# Miscellaneous #################

# Just an alias to link k9s tool to be able to run from anywhere in bash 
alias k9s='/home/tanmay/.local/bin/k9s'

# reload shell after changes in bashrc or any related file 
alias reload='exec $SHELL'

# check network speed
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# get progress bar while copying files, also use rsync since it's smarter and faster in copying
alias cpv='rsync -ah --info=progress2'

# instead of using rm, move file to trash can such that it can be restored if needed
alias tcn='mv --force -t ~/.local/share/Trash '

# grep from history, needs keyword to search for in bash history
alias gh='history|grep'
