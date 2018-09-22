--查看oracle表空间的名称及大小 
select t.tablespace_name, round(sum(bytes / (1024 * 1024)), 0) ts_size
  from dba_tablespaces t, dba_data_files d
 where t.tablespace_name = d.tablespace_name
 group by t.tablespace_name;

--查看oracle表空间物理文件的名称及大小 
select tablespace_name,
       file_id,
       file_name,
       round(bytes / (1024 * 1024), 0) total_space
  from dba_data_files
 order by tablespace_name;
--查看oracle回滚段名称及大小      
select segment_name,
       tablespace_name,
       r.status,
       (initial_extent / 1024) initialextent,
       (next_extent / 1024) nextextent,
       max_extents,
       v.curext curextent
  from dba_rollback_segs r, v$rollstat v
 where r.segment_id = v.usn(+)
 order by segment_name;


select * from  v$database ;
