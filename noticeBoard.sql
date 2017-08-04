use shopDB;
create table noticeBoard(
	num INT NOT NULL primary key,#파란색 글씨는 대소문자 구별 X
    title CHAR(30) NOT NULL,
    name CHAR(5) NOT NULL,
    content varchar(1000) NOT NULL
);

select * from noticeBoard;
insert into noticeBoard values(
	5,
    "sss",
    "ss",
    "s"
);

select * from noticeBoard order by num desc;
#내림차순으로 정렬해서 select
select * from noticeBoard limit 3;
#결과를 위에서부터 3개의 행까지만 보여줌.
select num from noticeBoard order by num desc limit 1;
#게시글 내림차순 정렬하는데 그중에 1개의 행만 보이게 함.