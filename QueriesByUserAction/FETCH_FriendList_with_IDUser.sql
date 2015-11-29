-- FETCH list of friends given IDUser
-- auxiliar procedure

CREATE PROCEDURE FETCH_FRIEND_LIST_WITH_IDUSER
(@IDUser int)
AS
BEGIN
	SELECT 
			USER2.IDUser
	FROM	
			MA_User AS USER1,
			MA_User AS USER2,
			MA_Users_Relation
	WHERE	
			USER1.IDUser = MA_Users_Relation.IDUser_1
		AND	USER2.IDUser = MA_Users_Relation.IDUser_2
		AND	USER1.IDUser = @IDUser
	ORDER BY
			USER2.Name
END


--EXECUTE FETCH_FRIEND_LIST_WITH_IDUSER 1