import utils.Logger.MeetAppLogger;

import play.*;
import play.mvc.*;

public class Global extends GlobalSettings {

    //Method will be run on startup
    //We can use this to set services running, etc.
    @Override
    public void onStart(Application app) {
        //MeetAppLogger meetAppLogger = new MeetAppLogger(LoggerMode.DEFAULT);

        //meetAppLogger.run();
    }
}
