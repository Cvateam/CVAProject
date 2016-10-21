create table keyword(
num number primary key,
csharpkeyword varchar2(100),
javakeyword varchar2(100)
)

create sequence keyword_seq;

select * from keyword;

insert into keyword values(keyword_seq.nextval,'abstract','abstract')
insert into keyword values(keyword_seq.nextval,'bool','boolean');
insert into keyword values(keyword_seq.nextval,'case','case');
insert into keyword values(keyword_seq.nextval,'break','break');
insert into keyword values(keyword_seq.nextval,'catch','catch');
insert into keyword values(keyword_seq.nextval,'char','char');
insert into keyword values(keyword_seq.nextval,'const','const');
insert into keyword values(keyword_seq.nextval,'continue','continue');
insert into keyword values(keyword_seq.nextval,'default','default');
insert into keyword values(keyword_seq.nextval,'do','do');
insert into keyword values(keyword_seq.nextval,'double','double');
insert into keyword values(keyword_seq.nextval,'else','else');
insert into keyword values(keyword_seq.nextval,'enum','enum');
insert into keyword values(keyword_seq.nextval,'finally','finally');
insert into keyword values(keyword_seq.nextval,'float','float');
insert into keyword values(keyword_seq.nextval,'for','for');
insert into keyword values(keyword_seq.nextval,'if','if');
insert into keyword values(keyword_seq.nextval,'interface','interface');
insert into keyword values(keyword_seq.nextval,'long','long');
insert into keyword values(keyword_seq.nextval,'new','new');
insert into keyword values(keyword_seq.nextval,'null','null');
insert into keyword values(keyword_seq.nextval,'private','private');
insert into keyword values(keyword_seq.nextval,'protected','protected');
insert into keyword values(keyword_seq.nextval,'public','public');
insert into keyword values(keyword_seq.nextval,'return','return');
insert into keyword values(keyword_seq.nextval,'short','short');
insert into keyword values(keyword_seq.nextval,'static','static');
insert into keyword values(keyword_seq.nextval,'switch','switch');
insert into keyword values(keyword_seq.nextval,'this','this');
insert into keyword values(keyword_seq.nextval,'throw','throw');
insert into keyword values(keyword_seq.nextval,'try','try');
insert into keyword values(keyword_seq.nextval,'void','void');
insert into keyword values(keyword_seq.nextval,'volatile','volatile');
insert into keyword values(keyword_seq.nextval,'while','while');
insert into keyword values(keyword_seq.nextval,'FALSE','FALSE');
insert into keyword values(keyword_seq.nextval,'TRUE','TRUE');
insert into keyword values(keyword_seq.nextval,'class','class');
insert into keyword values(keyword_seq.nextval,'base','super');
insert into keyword values(keyword_seq.nextval,'virtual','extends');

insert into keyword values(keyword_seq.nextval,'explicit',);
insert into keyword values(keyword_seq.nextval,,'assert');
insert into keyword values(keyword_seq.nextval,,'package');
insert into keyword values(keyword_seq.nextval,,'strictfp');
insert into keyword values(keyword_seq.nextval,,'synchronized');
insert into keyword values(keyword_seq.nextval,,'throws');
insert into keyword values(keyword_seq.nextval,,'transient');
insert into keyword values(keyword_seq.nextval,'as',);
insert into keyword values(keyword_seq.nextval,'checked',);
insert into keyword values(keyword_seq.nextval,'decimal',);
insert into keyword values(keyword_seq.nextval,'delegate',);
insert into keyword values(keyword_seq.nextval,'event',);
insert into keyword values(keyword_seq.nextval,'extern',);
insert into keyword values(keyword_seq.nextval,'fixed',);
insert into keyword values(keyword_seq.nextval,'foreach',);
insert into keyword values(keyword_seq.nextval,'impliciit',);
insert into keyword values(keyword_seq.nextval,'in',);
insert into keyword values(keyword_seq.nextval,'internal',);
insert into keyword values(keyword_seq.nextval,'is',);
insert into keyword values(keyword_seq.nextval,'lock',);
insert into keyword values(keyword_seq.nextval,'objector',);
insert into keyword values(keyword_seq.nextval,'operator',);
insert into keyword values(keyword_seq.nextval,'out',);
insert into keyword values(keyword_seq.nextval,'override',);
insert into keyword values(keyword_seq.nextval,'params',);
insert into keyword values(keyword_seq.nextval,'readonly',);
insert into keyword values(keyword_seq.nextval,'ref',);
insert into keyword values(keyword_seq.nextval,'sbyte',);
insert into keyword values(keyword_seq.nextval,'sealed',);
insert into keyword values(keyword_seq.nextval,'stackalloc',);
insert into keyword values(keyword_seq.nextval,'string','String');
insert into keyword values(keyword_seq.nextval,'String','String');
insert into keyword values(keyword_seq.nextval,'struct',);

drop table keyword;