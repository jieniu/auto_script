#!/bin/sh

SALT_HOME="/srv/salt/user"

if [ $# -lt 3 ]
then
    echo "usage: $0 username newpasswd hostnames"
    echo "example: sudo ./userpasswd.sh test password ko-79,ko-78"
    exit
fi

username=$1
password=$2
host=$3

echo "salt -L \"$host\" shadow.set_password ${username} `openssl passwd -1 -salt $username $password`"
salt -L "$host" shadow.set_password ${username} `openssl passwd -1 -salt $username $password`

