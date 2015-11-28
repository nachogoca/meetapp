package controllers;

import play.*;
import play.mvc.*;

import views.html.*;

public class Application extends Controller {

    public Result index() {
        return ok(index.render("Puto el que lo lea"));
    }

    public Result testParameters(String userID) {
        return ok(newIndex.render(userID));
    }




}
