-- FETCH_EVENT_PROFILE_COMMENT_LIST
-- Fetch comments from event. 
-- Commentid, Comment text, commment creator and comment datetime

SELECT	
		Comment.IDComment,
		Comment.CommentText,
		Comment.CreationDate,
		MA_User.Name,
		MA_User.LastName
FROM	
		Comment
		JOIN Event ON (Comment.IDEvent = Event.IDEvent)
		JOIN MA_User ON (MA_User.IDUser = Comment.IDUserCreator)
WHERE	
		Event.IDEvent = 2
ORDER BY
		CreationDate