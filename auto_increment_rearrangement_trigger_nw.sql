
delimiter //
create trigger trg_NB
	after delete
    on NB
    for each row 
begin
	call NB_ReNumber();
end //
delimiter ;

select * from NB;
#트리거 만들어서 row를 마음대로 지울 수 없음.
#실행되지 않음
# auto_increment를 재정렬하는 3개의 쿼리를 한대 묶음화를 해놓고 편하게 호출해서 쓰게 만들 수 있음.(Stored Procedures)
# 근데 더 편하게 하려고 트리거를 만들어서 행이 삭제되면 자동으로 MySQL에서 프로시저를 호출하게 만들려고 시도해봤지만, 트리거를 통해서 넘버링을 다시 시킬수는 없다는 것을 확인.

#트리거를 통해서 동일한 테이블을 대상으로 update 쿼리를 사용할 수 없기 때문.