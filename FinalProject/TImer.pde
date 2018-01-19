// taken from csc 30 demo
class Timer {
  // data
  int startTime, timeToWait, endTime;
  
  // constructor
  Timer(int _timeToWait) {
    timeToWait = _timeToWait;
  }
  
  // behaviour
  void begin() {
    startTime = millis();// setting startTime To milis (0ish)
    endTime = startTime + timeToWait;// calculating the end time
  }
  boolean isFinished() {
    if (millis() >= endTime) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void setWaitTime(int _timeToWait) {
    timeToWait = _timeToWait;
  }
  
}