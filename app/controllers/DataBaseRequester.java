package controllers;

import play.*;
import play.mvc.*;
import java.util.ArrayList;
import models.*;

public class DataBaseRequester extends Controller {

    public Result eventList(int userID) {
        ArrayList<Event> listOfEvents = null;
        return ok(play.libs.Json.toJson(listOfEvents));
    }

    public Result eventProfile(int userID, int eventID) {
        Event eventFetched = null;
        return ok(play.libs.Json.toJson(eventFetched));
    }

    public Result userProfile(int userID) {
        User userFetched = null;
        return ok(play.libs.Json.toJson(userFetched));
    }

    public Result placeProfile(int userID, int placeID) {
        Place placeFetched = null;
        return ok(play.libs.Json.toJson(placeFetched));
    }

    public Result eventComments(int userID, int eventID) {
        ArrayList<Comment> commentsFetched = null;

        return ok(play.libs.Json.toJson(commentsFetched));
    }

}
