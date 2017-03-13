#!/bin/sh

IP1=ip1
IP2=ip2
IP3=ip3
MYID=1

path="/home/zoo"
package="zookeeper-3.4.9.tar.gz"
srcdir="zookeeper-3.4.9"
dir="zookeeper"

wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz
mkdir -p $path
tar xzf $package -C $path
cd $path
mv $path/$srcdir $path/$dir
cd $dir

mv conf/zoo_sample.cfg conf/zoo.cfg
mkdir $path/$dir/data
sed -i "s,dataDir=.*,dataDir=$path/$dir/data," conf/zoo.cfg
echo "server.1=$IP1:2888:3888" >> conf/zoo.cfg
echo "server.2=$IP2:2888:3888" >> conf/zoo.cfg
echo "server.3=$IP3:2888:3888" >> conf/zoo.cfg
echo $MYID >> $path/$dir/data/myid
