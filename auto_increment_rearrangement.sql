set @COUNT = 0;

update NB set n = NB_ReNumber@COUNT := @COUNT+1;
#NB라는 테이블에 모든 행에 n컬럼의 값을 숫자 1부터 다시 매김.
alter table NB auto_increment = 1;
#NB테이블의 auto_increment를 1부터 다시 수행하라는 것.



insert into NB values(null, "ㅎㄱㄷ");
#숫자 재정렬 하고 나서 insert하면 원래 값을 따라감. ex) 1,2,3,4,5 다음에 원래 6,7이었으니까 8,9가 insert됨.
select * from NB;

call NB_ReNumber();
#stored procedure 해놓은걸 사용함.