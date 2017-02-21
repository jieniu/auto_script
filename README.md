# this repo is my collection of automatic script
## redis
a script to generate redis cluster cross multi machine

1. download redis package && make
2. change the settings at the begin of the create-cluster file
3. `./create-cluster build` to build default 3 nodes, you can build another 3 nodes via another machine
4. `./create-cluster start` to start each of 3 nodes
5. `./create-cluster create` to create cluster
6. `./create-cluster stop` to stop every redis

### parameter
* PORT - start port, default is 7000
* NODES - slave or master nodes number, default is 3
* REDIS_PATH - your running redis path
* REDIS_SRC_PATH - your source redis path
* HOST - local ip
* HOST_SLAVE - another host ip
* BACKLOG - the listen parameter
* AUTH - the password of redis, default is nothing
* MAX_CLIENTS - max clients simultaneously a redis node can hold
* MAX_MEM_BYTES - max memory bytes of a redis node
