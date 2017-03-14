#!/bin/sh

SALT_HOME="/srv/salt/user"

if [ $# -lt 2 ]
then
    echo "usage: $0 username hostnames"
    echo "example: sudo ./useradd.sh test ko-79,ko-78"
    exit
fi

username=$1
host=$2

echo "salt -L \"$host\" cmd.run \"userdel -r $username\""
salt -L "$host" cmd.run "userdel -r $username"

