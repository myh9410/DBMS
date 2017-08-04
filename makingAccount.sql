create user ceo@'%' identified by 'P@ssw0rd';

set password for ceo=password('P@ssw0rd2');#ceo계정의 비밀번호 바꾸는 쿼리 'P@ssw0rd2'로 바꿈

grant select , update on *.* to ceo@'%';#grant쿼리는 지정한 계정에 권한을 부여
#위 쿼리는 ceo라는 계정에 권한을 모든 데이터베이스를 대상으로 
#select, update 쿼리를 사용할 수 있게 권한을 부여하는 쿼리임.

select * from mysql.user;#mysql의 계정들 확인 가능한 쿼리alter
#계정의 이름, 접근 제한 IP 확인 가능.
#비밀번호는 암호화되어있음. 계정의 권한도 확인 가능(select,insert,update 등)
update mysql.user set Host = '100.100.100.1'
where User = 'ceo';
#User가 ceo인 계정의 호스트값을 바꿈.
#위의 쿼리는 결국 ceo라는 계정의 접근 제한 IP를 100.100.100.1로 변경하기 위해 사용하는 쿼리임..
flush privileges;#계정정보 변경한 것 적용시키는 쿼리

create user staff@'%' identified by 'P@ssw0rd';

grant select, insert, update, delete on shopDB.* to staff@'%';
#shopDB에 지정한 권한을 사용할 수 있게 설정함. 5번 줄의 grant는 모든 DB에 대해서... 이 grant는 shopDB에 대해서...
revoke select, update on shopDB.* from staff@'%';
#revoke는 부여했던 권한을 제거하는 쿼리 
show grants for staff@'%';
#staff계정의 권한 상태를 확인할 수 있음.
revoke all on shopDB.* from staff@'%';
#shopDB의 모든 권한을 제거
use shopDB;
show table status;
#사용하고 있는 DB인 shopDB에 만들어져 있는 table들의 이름, 저장되어진 행 등의 여러 상세 정보를 확인 가능.
#table 만들어진 시간, 인코딩 설정 상태, Auto_increment를 확인 가능.(Auto_increment 아직 안배움)
use employees;
select * from employees;
#select 쿼리는 저장되어 있는 테이블에 값을 확인하는 쿼리.
#저장된 데이터가 많으면 select 쿼리를 수행하는데 부하도 높고, 쿼리 실행되는데 시간도 오래 걸림.
describe employees;
#employees 테이블의 자료형, 컬럼의 이름 등 확인 가능.
#Null이 NO -> Not Null(공백허용하지 않음.)
#Key 가 PRI -> 중복 X
SELECT 
    emp_no '사원번호', 
    birth_date '출생일', 
    first_name '이름', 
    last_name '성', 
    gender '성별', 
    hire_date '입사일'
FROM
    employees;
#빗자루 모양 아이콘 누르면 쿼리를 깨끗하게 정리해 줌.
#원래 있던 컬럼 뒤에 '컬럼별칭'을 지정함.
#원래 컬럼의 이름을 아예 바꾸는 것은 아니고 보기 편하게 잠시 바꿈.