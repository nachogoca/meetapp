package utils.Logger;
/*
Classes implementing the Loggable interface must override the getStatus() method,
which will return the objects current state for logging.
*/
public interface Loggable {
    public String getStatus();
}
