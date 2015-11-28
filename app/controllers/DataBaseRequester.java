package controllers;

import play.*;
import play.mvc.*;
import java.util.ArrayList;
import models.*;
import play.db.*;
import java.sql.*;

public class DataBaseRequester extends Controller {


    public Result eventList(int userID) {
        ArrayList<Event> listOfEvents = new ArrayList<Event>();

        return ok(play.libs.Json.toJson(listOfEvents));
    }

    public Result eventProfile(int userID, int eventID) {
        Event eventFetched = new Event();
        return ok(play.libs.Json.toJson(eventFetched));
    }

    public Result userProfile(int userID) {
        User userFetched = new User();
        return ok(play.libs.Json.toJson(userFetched));
    }

    public Result placeProfile(int userID, int placeID) {
        Place placeFetched = new Place();
        return ok(play.libs.Json.toJson(placeFetched));
    }

    public Result eventComments(int userID, int eventID) {
        ArrayList<Comment> commentsFetched = new ArrayList<Comment>();

        return ok(play.libs.Json.toJson(commentsFetched));
    }

}
