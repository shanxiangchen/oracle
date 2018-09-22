--�鿴������ʱ������ǰ10��SQL���
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

--�鿴CPU����ʱ������ǰ10��SQL���
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
--�鿴���Ĵ��̶�ȡ����ǰ10��SQL���
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
