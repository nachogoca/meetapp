package controllers;

import play.*;
import play.mvc.*;
import java.util.ArrayList;
import models.*;
import play.db.*;
import java.sql.*;
import play.libs.Json;

public class DataBasePoster extends Controller{
    public DataBasePoster() {

    }

    public Result eventProfile() { 
        Event newEventProfile = new Event();
        Event serializedEvent = Json.fromJson(request().body().asJson(), Event.class);

        if(serializedEvent == null) {
            return badRequest("Json broken.");
        }
        else {
            return ok("This is the sent json:" + serializedEvent.toString());
        }

    }



}
