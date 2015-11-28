-- PUT_EVENT_PROFILE
--	FacebookIDCreator varchar(50), EventName varchar(50), EventDescription varchar(50), 
--	EventDateTime datetime, Visibility varchar(50), PlaceID int

INSERT INTO Event (IDEvent, IDPlace, IDUser, Name, Description, DateTime, Visibility)
VALUES (1101, 1, 1, 'NEW EVENT', 'DESCRIPTION', CONVERT(DATE, GETDATE()), 'Public')