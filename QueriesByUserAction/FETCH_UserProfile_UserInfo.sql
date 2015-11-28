-- FETCH_USER_PROFILE_USER_INFO
-- Obtain user profile -> Personal info

CREATE PROCEDURE FETCH_USER_PROFILE_USER_INFO
(@FACEBOOK_ID varchar(50))
AS
BEGIN

	SELECT	
			MA_USER.Name,
			MA_User.LastName,
			MA_User.Birthdate,
			MA_User.Gender,
			Location.Latitude,
			Location.Longitude
	FROM	
			MA_User,
			Location
	WHERE	
			MA_User.IDLocation = Location.IDLocation
		AND	MA_User.FacebookID = @FACEBOOK_ID
		
END

EXECUTE FETCH_USER_PROFILE_USER_INFO 'CHA89EUF3LZOAP75SZS1BB'