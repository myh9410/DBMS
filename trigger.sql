delimiter //
create trigger trg_deleteMemberTBL
	after delete#delete쿼리가 작동했을 때
    on memberTBL
    for each row#모든 행을 대상으로
begin
	insert into deleteMemberTBL values(
		OLD.memberID,#위에서 지정한 테이블 memberTBL
        OLD.memberName,
        OLD.memberAddress,
        curdate()
    );
end//
DELIMITER ;




delete from memberTBL where memberName = "당탕이";

select * from deleteMemberTBL;
select * from memberTBL;