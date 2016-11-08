create table customer (
	custid varchar2(50) primary key,
	password varchar2(50) not null
);
insert into customer values ('a','a');

commit;


create table keyword (
	num number primary key,
	csharpkeyword varchar2(100),
	javakeyword varchar2(100)
)

create sequence keyword_seq;

select * from keyword;
select csharpkeyword, javakeyword from keyword;

insert into keyword values(keyword_seq.nextval,'abstract','abstract');
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
insert into keyword values(keyword_seq.nextval,'string','String');
insert into keyword values(keyword_seq.nextval,'Main','main');
insert into keyword values(keyword_seq.nextval,'using','import');
insert into keyword values(keyword_seq.nextval,'namespace', ' '); --문제 발견 
insert into keyword values(keyword_seq.nextval,'Console.WriteLine','System.out.println');
insert into keyword values(keyword_seq.nextval,'Console.Write','System.out.print');

delete from keyword where csharpkeyword='namespace';

drop sequence keyword_seq;
drop table keyword;


create table board(
javaCode varchar2(3000) 
,cSharpCode varchar2(3000)
, javaScannerInput varchar2(100) 
,cShrapScannerInput varchar2(100)
, boardTitle1 varchar2(100)   
, boardTitle2 varchar2(100)
,custid varchar2(50)   not null
, boardMemo varchar2(1000)
,boardnum  number primary key
);

create sequence board_seq;

insert into board values ('public class Test
{
	public static void main (String[] args)
	{
	System.out.println("success");
	}
}' , null, null,null,'sysout',null , 'a' , '처음인데 재밌네' , board_seq.nextval);

select * from board;
                           