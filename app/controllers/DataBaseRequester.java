package controllers;

import play.*;
import play.mvc.*;

import java.util.ArrayList;
import models.*;

public class DataBaseRequester extends Controller {

    public static ArrayList<Event> eventList(int userID) {
        ArrayList<Event> listOfEvents;


        return ok(play.libs.Json.toJson(listOfEvents));
    }

    public static Event eventProfile(int userID, int eventID) {

    }

    public static User userProfile(int userID) {

    }

    public static Place placeProfile(int userID, int placeID) {

    }

    public static Comment eventComments(int userID, int eventID) {

    }

}
