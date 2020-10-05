#!/bin/bash

which python3 2> /dev/null || sudo apt-get install python3 -y
which pip3 2> /dev/null    || sudo apt-get install python3-pip -y
which ansible 2> /dev/null || sudo pip3 install ansible

OLDPWD=$(pwd)
if [ -z $1 ]; then
  WORKDIR=$(mktemp -d)
  TMP_WORKDIR="yes"
else
  WORKDIR=$1
fi

cd $WORKDIR
if [ -d ./ansible-ros-robot ]; then
  cd ./ansible-ros-robot
  git stash
  git stash drop
  git clean -xfd
  git pull
else
  git clone https://github.com/szymonrychu/ansible-ros-robot.git
  cd ./ansible-ros-robot
fi

sudo ansible-playbook playbook.yaml

cd $OLDPWD

if [ ! -z $TMP_WORKDIR ]; then
  rm -rf $WORKDIR
fi