-- PUT_EVENT_PROFILE
--	FacebookIDCreator varchar(50), EventName varchar(50), EventDescription varchar(50), 
--	EventDateTime datetime, Visibility varchar(50), PlaceID int

CREATE PROCEDURE PUT_EVENT_PROFILE_TEST
(@IDPlace			int,
@IDCreatorUser		int, --change to facebook id
@Name			varchar(50),
@Description	varchar(500),
@DateTime		datetime,
@Visibility		varchar(50)) -- Public|Private
AS
BEGIN

	-- The last id inserted, necessary for other queries
	DECLARE @NewIdentity INT

	-- Temporary friend list table
	DECLARE @FriendListTable TABLE (IDFriendUser int)	

	BEGIN TRANSACTION [TranEvent]

	BEGIN TRY

		
		-- Create new event
		INSERT INTO Event(IDPlace, IDUser, Name, Description, DateTime, Visibility)
		VALUES (@IDPlace, @IDCreatorUser, @Name, @Description, @DateTime, @Visibility)

		-- The last identity value inserted
		SELECT @NewIdentity = SCOPE_IDENTITY()

		-- Get list of all friends. Visibility is not yet taken into account
		SELECT * INTO @FriendListTable FROM FETCH_FRIEND_LIST_WITH_IDUSER(@IDCreatorUser)

	COMMIT TRANSACTION [TranPlace]

	-- If an error occurs in transaction
	END TRY
	BEGIN CATCH
	  ROLLBACK TRANSACTION [TranPlace]
	END CATCH  

END

INSERT INTO Event ( IDPlace, IDUser, Name, Description, DateTime, Visibility)
VALUES (1101, 1, 1, 'NEW EVENT', 'DESCRIPTION', CONVERT(DATE, GETDATE()), 'Public')