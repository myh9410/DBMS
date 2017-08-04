create table NB(
	n int not null primary key auto_increment,
    name char(5) not null
);

insert into NB values(null, "ㅁㄴㅇ");
#5번 쿼리 실행하면 1~5까지 번호 메겨지는데, 중간에 3,4번을 지운다고 해서 다시 auto_increment하면 3,4가 생기지는 않는다.
select * from NB;