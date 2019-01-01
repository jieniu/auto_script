# MySQL 配置项

## 执行时间

### MAX_EXECUTION_TIME

根据业务需要设置执行语句可以容忍的最大时间，避免长事务的发生

> The MAX_EXECUTION_TIME hint is permitted only for SELECT statements. It places a limit N (a timeout value in milliseconds) on how long a statement is permitted to execute before the server terminates it

```
mysql> set MAX_EXECUTION_TIME 1000; 
```

查看该值

```
 show variables like 'MAX_EXECUTION_TIME'; 
```



## 查看日志

### general_log

general_log 中记录了所有对数据库的操作，例如你可以通过查看该日志，了解你使用的 MySQL Client 是否开启了 `SET autocommit=1` 选项，开启方法:

```
mysql> set global general_log=on;  # off 表示关闭
mysql> set global log_output='table'; # 将日志输出到 mysql.general_log 表中
```

> 注：这里建议将 autocommit 设置为1，否则你的 client 在执行 SQL 时会自动创建事务，而当 client 出现异常而断开时，该事务不会立即终止，这会导致由 MVCC 引起的长事务问题，即系统中会消耗大量的资源用来存储 redo log。此外，**general_log 建议只在测试环境开启**。


参考：
* 极客时间《MySQL实战45讲》
