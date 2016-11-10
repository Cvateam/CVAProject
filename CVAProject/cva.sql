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

create table question(
	qno number primary key,
	title varchar2(100) not null,
	content varchar2(1000) not null,
	lv varchar2(10) not null,
	solution varchar2(4000) not null
)

create sequence question_seq

select * from question;
insert into question values(question_seq.nextval,'원의면적구하기','원의 반지름을 입력받아 원의 면적을 구하시오','<중>','import java.util.Scanner;\n\npublic class test{\n\tpublic static void main(String[] args) {\n\t\tScanner input = new Scanner(System.in);\n\n\t\tdouble area, area1;\n\t\tSystem.out.print(\"원의 반지름을 입력하세요:\");\n\t\tarea = input.nextInt();\n\t\tarea1 = area * area * Math.E;\n\t\tSystem.out.printf(\"%,10.2f\", area1);\n\t}\n}\n');
insert into question values(question_seq.nextval,'숫자찍기','그림과 같이 모양으로 숫자를 출력하시오','<상>','public class test {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println(\"\");\n\t\tdraw(5);\n\t\tdraw(7);\n\t\tdraw(9);\n\t}\n\n\tprivate static void draw(int size) {\n\t\tfor (int i = 1; i < size - 1; i++) {\n\t\t\tfor (int j = 0; j < size - 2 - i; j++) {\n\t\t\t\tSystem.out.printf(\"0\");\n\t\t\t}\n\t\t\tfor (int k = 0; k < 2 * i - 1; k++) {\n\t\t\t\tSystem.out.printf(\"1\");\n\t\t\t}\n\t\t\tfor (int m = 0; m < size - 2 - i; m++) {\n\t\t\t\tSystem.out.printf(\"0\");\n\t\t\t}\n\t\t\tSystem.out.println(\"\");\n\t\t}\n\t\tSystem.out.println(\"\");\n\t\n\t}\n}\n');
insert into question values(question_seq.nextval,'구구단','그림과 같이 구구단을 출력하시오','<하>','public class test{\n\tpublic static void main(String[] args) {\n\t\tfor(int i=1;i<10;i++){\n\t\t\tfor(int j=2;j<10;j++){\n\t\t\t\tSystem.out.print(j+\"X\"+i+\"=\"+i*j);\n\t\t\t\tSystem.out.print(\"\t\t\");\n\t\t\t}\n\t\t\tSystem.out.println();\n\t\t}\n\t}\n\n}\n');
insert into question values(question_seq.nextval,'홀수짝수구분','숫자를 입력받아 홀수인지 짝수인지 구분하여 출력하시오','<하>','public class odd_number {\n\tpublic static void main(String[] args) {\n\n\t\tScanner scan = new Scanner(System.in);\n\t\tint number;\n\n\t\tSystem.out.print(\"숫자를 입력하세요:\");\n\t\tnumber = scan.nextInt();\n\t\tif (number % 2 != 0) {\n\t\t\tSystem.out.println(number + \"는 홀수 입니다.\");\n\t\t} else {\n\t\t\tSystem.out.println(number + \"는 짝수 입니다.\");\n\t\t}\n\t}\n}\n');
insert into question values(question_seq.nextval,'2진법을 10진법으로 변환','0과1로 이루어진 2진법을 입력받아 10진법으로 변환하여 출력하시오','<중>','public class number_representation_system {\n\tstatic double number;\n\tpublic static void main(String[] args) {\n\t\tScanner scan =  new Scanner(System.in);\n\t\tSystem.out.print(\"2진법을 입력하시오(input:0,1):\");\n\t\tnumber = scan.nextDouble();\n\t\tint count =0;\n\t\tint dec =0;\n\t\tint doublebin =1;\n\t\twhile((int)number/10>0){\n\t\t\tdec =((int)number%10)*doublebin+dec;\n\t\t\tnumber =(int)number/10;\n\t\t\tcount++;\n\t\t\tdoublebin*=2;\n\t\t}\n\t\tdec +=doublebin;\n\t\tSystem.out.println(dec);\n\t}\n}\n');



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
javaCode varchar2(4000)
,cSharpCode varchar2(4000)
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
                           