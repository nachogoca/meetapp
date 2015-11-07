package controllers;
import java.util.*;

import play.*;
import play.mvc.*;

import views.html.*;

public class Application extends Controller {

    public Result index() {
        Map<String, String> itWorks = new HashMap<String, String>();
        itWorks.put("message", "It works");
        return ok(play.libs.Json.toJson(itWorks));
    }

    public Result helloTest() {
    	return ok("otra cosa prueba");
    }

    public Result fetchEvents()
    {
    	return ok("Events");
    }



}
