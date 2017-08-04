use sqlDB;

select userID, name from userTBL where birthYear >= 1970 and height >= 182;
								#왼쪽 오른쪽 조건식 둘다 만족하는 것 SELECT
select userID, name from userTBL where addr = '경남' or addr = '전남' or addr = '경북';
								# addr이 경남이거나 전남이거나 경북이면 select함.
select userID, name from userTBL where addr in ('경남', '전남', '경북');
								#5행의 쿼리를 이렇게도 쓸 수 있음
select userID, name from userTBL where name like '조_필';
# 위 조건은 name 컬럼에 값이 조라는 문자가 온 후에 아무 문자 1개가 온 후, 필이라는 문자가 오는 행을 select함.
# like를 사용할 때 _(언더바)는 어느 문자든 1개를 뜻함.
select userID, name from userTBL where name like '조%';
#조 다음에 뭐든지 오는 경우를 select(아무것도 없어도 되고, 여러글자가 있어도 된다.)
select name, height from userTBL order by height desc, name;
#위 정렬하는 방법은 height 컬럼을 기준으로 내림차순 정렬을 하는데, 만약 height 컬럼의 값이 똑같은게 있다면
# 그때는 name컬럼에 값을 기준으로 정렬하라..
select distinct addr from userTBL order by addr;
#addr이 중복되면 제거해서 보여줌.
#userTBL에 addr컬럼의 값을 출력하는 데, addr 컬럼에 값이 중복되면 1개만 출력하겠다.
use employees;
select * from employees;
select emp_no '사원번호', hire_date '입사일' from employees order by hire_date limit 5;
#입사일이 가장 오래된 5명의 사원번호와 입사일을 출력하겠다는 쿼리

use sqlDB;
create table buyTBL2(
	select * from buyTBL
);

select * from buyTBL2;

create table buyTBL3(
	select userID, prodName from buyTBL
);

select userID, sum(price*amount) '총 구매 금액' from buyTBL group by userID;
#위 쿼리는 userID를 기준으로 그룹을 만들고, 그룹에 있는 price컬럼의 값과 amount 컬럼의 값을 곱하기 하고
#userID별로 그 값을 다 더해서 출력하겠다는 쿼리
select userID, avg(price*amount) '평균 구매 금액' from buyTBL group by userID;
select userID, avg(price*amount) '평균 구매 금액' from buyTBL userID;
