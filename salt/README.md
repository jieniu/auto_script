# 使用salt管理用户脚本

## 环境搭建

1. 在salt环境目录下创建top.sis文件
```
$ cat /srv/salt/top.sis
base:
  '*':
    - user.useradd
```
2. 创建`/srv/salt/user/`目录

## 脚本说明

1. useradd.sh: 添加用户
2. userdel.sh: 删除用户
3. userinfo.sh: 查看用户信息
4. userpasswd.sh: 修改用户密码。
