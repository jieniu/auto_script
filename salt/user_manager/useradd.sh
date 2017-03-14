#!/bin/sh

SALT_HOME="/srv/salt/user"

if [ $# -lt 3 ]
then
    echo "usage: $0 username passwd hostnames group"
    echo "example: sudo ./userdel.sh test test ko-79,ko-78 dev"
    exit
fi

username=$1
passwd=$2
host=$3
group=$4
groupLen=${#group}

password=`openssl passwd -1 -salt $username $passwd`

echo "${username}:" > ${SALT_HOME}/useradd.sls
echo " user.present:" >> ${SALT_HOME}/useradd.sls
echo "   - fullname: ${username}" >> ${SALT_HOME}/useradd.sls
echo "   - password: ${password}" >> ${SALT_HOME}/useradd.sls
if [ $groupLen -gt 0 ]
then
    echo "   - groups:">> ${SALT_HOME}/useradd.sls
    echo "     - $group">> ${SALT_HOME}/useradd.sls
fi

echo "salt -L \"$host\" state.sls user.useradd"
salt -L "$host" state.sls user.useradd

