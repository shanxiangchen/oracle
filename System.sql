--������ʱ��ռ�
create temporary tablespace scott_temp
tempfile 'E:\Oracle\oradata\orcl\scott_temp.dbf'
size 50m
autoextend on 
next 50m maxsize 4096m
extent management local;

--�������ݱ�ռ�
create tablespace scott_data
datafile 'E:\Oracle\oradata\orcl\scott_data.dbf'
size 50m
autoextend on 
next 50m maxsize 20480m
extent management local;

--�����û���ָ����ռ�
create user shanxiang identified by abcd1234
drop user shanxiang;
--default tablespace scott_data
--temporary tablespace scott_temp;

--�޸��û�Ĭ�ϱ�ռ�
--alter user scott default tablespace scott_data;
--alter user scott default temporary tablespace scott_temp;

--���û�����Ȩ��
grant connect,resource,dba to scott;

revoke dba from scott;

grant select on sys.user_tables to scott;


--�޸�����
alter user scott identified by tiger;

--�޸�������Ч��
select username,profile from dba_users;
select * from dba_profiles s where s.profile='DEFAULT' AND resource_name='PASSWORD_LIFE_TIME';
alter profile default limit password_life_time unlimited;

--drop user shanxiang cascade;
--drop temporary tablespace scott_temp including contents and tempfile;

--����������������ڴ�

show parameter processes ;

alter system set processes=432 scope=spfile ;

show parameter sessions ;

show parameter open_cursors;

alter system set open_cursors=1200 scope=spfile;

show parameter mem;
--���ռ���ڴ�
alter system set memory_max_target=8876M  scope=spfile;
--�ڴ�ռ����SGA+PGA
alter system set memory_target=8762M  scope=spfile;
--Ĭ��SGAռ60%��PGAռ40%
show parameter target

show parameter sga;

show parameter pga ;

--ʹ�ñ��������������ݿ�
startup pfile='E:\Oracle\admin\orcl\pfile\init.ora.13242116103547'
create spfile from pfile='E:\Oracle\admin\orcl\pfile\init.ora.13242116103547';
create pfile='E:\Oracle\admin\orcl\pfile\init.ora.13242316103547' from spfile='E:\Oracle\product\11.2.0\dbhome_1\database\SPFILEORCL.ORA';

shutdow immediate; 

startup; 


