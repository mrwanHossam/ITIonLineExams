CREATE PROC PROC_check_user @username nvarchar(50)
as 
begin
SELECT password,usertype FROM wepUsers WHERE username = @username
end
