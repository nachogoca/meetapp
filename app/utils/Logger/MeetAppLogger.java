package utils.Logger;

import java.util.Scanner;
import java.util.ArrayList;

public class MeetAppLogger {

    public static LoggerMode mode = LoggerMode.DEFAULT;

    private static MeetAppLogger loggerInstance = null;

    //List of objects subscribed to the logger
    //Logger will automatically log objects as their status is changed

    private static ArrayList<Loggable> subscribedObjects;

    public enum LoggerMode {
        DEFAULT,
        CONSOLE_OFF,
        FILE_OFF
    }

    public MeetAppLogger() {
        subscribedObjects = new ArrayList<Loggable>();
    }

    public static void setMode(LoggerMode mode) {
        synchronized(MeetAppLogger.class) {
            MeetAppLogger.mode = mode;
        }
    }

    public static MeetAppLogger getInstance() {
        if(loggerInstance == null)
        {
            synchronized(MeetAppLogger.class) {
                if(loggerInstance == null) loggerInstance = new MeetAppLogger();
            }
        }
        return loggerInstance;
    }

    public void subscribe(Loggable loggableObject) {
        this.subscribedObjects.add(loggableObject);
        log(loggableObject.getStatus());
    }

    public void log(Object o) {

    }

    public void log(String message, Object o) {

    }

    public void log(String message) {

    }


}
