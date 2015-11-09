package controllers;

import play.*;
import play.mvc.*;
import java.util.ArrayList;
import models.*;
import play.db.*;
import java.sql.*;

public class DataBasePoster extends Controller{
    public DataBasePoster() {

    }

    public Result eventProfile() {
        Event newEventProfile = new Event();
        return ok();
    }



}
