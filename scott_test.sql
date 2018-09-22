drop table jett_database_test ;

create table jett_database_test(
  policy_no number(10) ,
  doc_type varchar2(1),
  status number(2),
  sys_date date,
  account_select number(4)
);

select * from jett_database_test ;

delete from jett_database_test ;

truncate table jett_database_test ;

select * from v$session

