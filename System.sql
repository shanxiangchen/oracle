--创建临时表空间
create temporary tablespace scott_temp
tempfile 'E:\Oracle\oradata\orcl\scott_temp.dbf'
size 50m
autoextend on 
next 50m maxsize 4096m
extent management local;

--创建数据表空间
create tablespace scott_data
datafile 'E:\Oracle\oradata\orcl\scott_data.dbf'
size 50m
autoextend on 
next 50m maxsize 20480m
extent management local;

--创建用户并指定表空间
create user shanxiang identified by abcd1234
drop user shanxiang;
--default tablespace scott_data
--temporary tablespace scott_temp;

--修改用户默认表空间
--alter user scott default tablespace scott_data;
--alter user scott default temporary tablespace scott_temp;

--给用户授予权限
grant connect,resource,dba to scott;

revoke dba from scott;

grant select on sys.user_tables to scott;


--修改密码
alter user scott identified by tiger;

--修改密码有效期
select username,profile from dba_users;
select * from dba_profiles s where s.profile='DEFAULT' AND resource_name='PASSWORD_LIFE_TIME';
alter profile default limit password_life_time unlimited;

--drop user shanxiang cascade;
--drop temporary tablespace scott_temp including contents and tempfile;

--设置连接数和最大内存

show parameter processes ;

alter system set processes=432 scope=spfile ;

show parameter sessions ;

show parameter open_cursors;

alter system set open_cursors=1200 scope=spfile;

show parameter mem;
--最大占用内存
alter system set memory_max_target=8876M  scope=spfile;
--内存占用量SGA+PGA
alter system set memory_target=8762M  scope=spfile;
--默认SGA占60%，PGA占40%
show parameter target

show parameter sga;

show parameter pga ;

--使用备份设置启动数据库
startup pfile='E:\Oracle\admin\orcl\pfile\init.ora.13242116103547'
create spfile from pfile='E:\Oracle\admin\orcl\pfile\init.ora.13242116103547';
create pfile='E:\Oracle\admin\orcl\pfile\init.ora.13242316103547' from spfile='E:\Oracle\product\11.2.0\dbhome_1\database\SPFILEORCL.ORA';

shutdow immediate; 

startup; 


