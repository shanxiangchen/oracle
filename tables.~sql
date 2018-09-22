
--查询所有表
select * from sys.user_tables;

--建表
drop table scott.user_t;
create table scott.user_t(
     user_id number(10) primary key,
     user_name varchar2(20) not null,
     user_pwd varchar2(32) not null,
     user_email varchar2(50),
     manager number(10),
     age number(3),
     here_date date,
     flag varchar2(1) default 'Y'
);

--添加注释
comment on table scott.user_t is '用户表';
comment on column scott.user_t.user_id is '用户ID';
comment on column scott.user_t.user_name is '用户名';
comment on column scott.user_t.user_pwd is '用户密码';
comment on column scott.user_t.user_email is '用户邮箱';
comment on column scott.user_t.manager is '用户领导';
comment on column scott.user_t.age is '用户年龄';
comment on column scott.user_t.here_date is '入职时间';
comment on column scott.user_t.flag is '是否离职';

--设定表权限
grant select,insert,update,delete on scott.user_t to shanxiang;

--创建同义词
create synonym shanxiang.user_t for scott.user_t;

--插入数据
begin
  for i in 100..999 loop
    insert into scott.user_t values (i,'user'||i,'111','shanxiang@qq.com',1,25,sysdate,'Y');
  end loop;
  commit;
end;
/

select * from scott.user_t;

