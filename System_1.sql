--查看总消耗时间最多的前10条SQL语句
select *
  from (select v.sql_id,
               v.child_number,
               v.sql_text,
               v.elapsed_time,
               v.cpu_time,
               v.disk_reads,
               rank() over(order by v.elapsed_time desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 10;

--查看CPU消耗时间最多的前10条SQL语句
select *
  from (select v.sql_id,
               v.child_number,
               v.sql_text,
               v.elapsed_time,
               v.cpu_time,
               v.disk_reads,
               rank() over(order by v.cpu_time desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 10;
--查看消耗磁盘读取最多的前10条SQL语句
select *
  from (select v.sql_id,
               v.child_number,
               v.sql_text,
               v.elapsed_time,
               v.cpu_time,
               v.disk_reads,
               rank() over(order by v.disk_reads desc) elapsed_rank
          from v$sql v) a
 where elapsed_rank <= 10;
