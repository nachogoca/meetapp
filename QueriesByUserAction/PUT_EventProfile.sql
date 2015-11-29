-- PUT_EVENT_PROFILE
--	FacebookIDCreator varchar(50), EventName varchar(50), EventDescription varchar(50), 
--	EventDateTime datetime, Visibility varchar(50), PlaceID int

CREATE PROCEDURE PUT_EVENT_PROFILE_TEST_2
(@IDPlace			int,
@IDCreatorUser		int,
@Name			varchar(50),
@Description	varchar(500),
@DateTime		datetime,
@Visibility		varchar(50)) -- Public|Private
AS
BEGIN

	-- The last id inserted, necessary for other queries
	DECLARE @NewEventIdentity INT

	-- Temporary friend list table
	CREATE TABLE #TMP_FRIEND_LIST
	(RowId			int,
	IDFriendUser	int)


	BEGIN TRANSACTION [TranEvent]

	BEGIN TRY
			
		-- Create new event
		INSERT INTO Event(IDPlace, IDUser, Name, Description, DateTime, Visibility)
		VALUES (@IDPlace, @IDCreatorUser, @Name, @Description, @DateTime, @Visibility)

		-- The last identity value inserted
		SELECT @NewEventIdentity = SCOPE_IDENTITY()

		-- Get list of all friends. Visibility is not yet taken into account
		INSERT INTO #TMP_FRIEND_LIST EXECUTE FETCH_FRIEND_LIST_WITH_ROWID @IDCreatorUser
		
		-- Variables to visit each friend
		DECLARE @friendListCount INT 
		SET @friendListCount  = (SELECT COUNT(*) FROM #TMP_FRIEND_LIST)

		-- for each friend, create a recommendation and a relation between MA_User_Event
		DECLARE @friendIndex int = 1
		WHILE @friendIndex <= @friendListCount BEGIN
			
			-- Create recommendation, weigth = 0 				
			INSERT INTO Recommendation (IDEvent, IDUser, Weight)
			VALUES (@NewEventIdentity, (SELECT T.IDFriendUser FROM #TMP_FRIEND_LIST AS T WHERE T.RowId = @friendIndex), 0)

			-- Create relation between user and event, with attendance = 0				
			INSERT INTO MA_User_Event (IDEvent, IDUser, Attendance)
			VALUES (@NewEventIdentity, (SELECT T.IDFriendUser FROM #TMP_FRIEND_LIST AS T WHERE T.RowId = @friendIndex), 0)

			SET @friendIndex = @friendIndex + 1
		END


	COMMIT TRANSACTION [TranPlace]

	-- If an error occurs in transaction
	END TRY
	BEGIN CATCH
	  ROLLBACK TRANSACTION [TranPlace]
	END CATCH  

END

EXECUTE PUT_EVENT_PROFILE_TEST_2 2, 1, 'Event PUT_EVENT_PROFILE_TEST_2', 'Description PUT_EVENT_PROFILE_TEST_2', '2015-11-29', 'Public'