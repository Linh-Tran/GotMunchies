// library imports
import android.location.Location;
import android.location.locListener;
import android.location.LocManager;
import android.content.Context;
import android.os.Bundle;
import android.Manifest;

// calling elements
ManageLocation locManager;
ListenLocation locListener;

/*Listen Location Class
-------------------------
Usage: implements locListener, if Location is true
it gets present values for variables:
-pNetProvider   -pLat
-pLong          -pAccurate
*/
class ListenLocation implements locListener{
  
  
  /*location change
  ---------------------------
  Usage: when string location is true, get method is used by location to set present net provider
  */
  public void locChange(Location location){
    pNetProvidor = location.getpNetProvidor();
    
    float pLat = location.getLat();
    float pLong = location.getLong();
    float pAccurate = location.getAccurate();
  }
  
  
/* Present Location function
---------------------------------
Usage: implements locManager which accesses the network providor for locListener to
pull present gps data if a true location is returned (app access is granted to network)
otherwise does nothing
*/
void pLocation(boolean true){

}
  
  

/* enabled status of providor on location
---------------------------------------------
Usage: sets the Present net provider to the string "pnetworkprovider" to be accessed by another function
*/
public void enabledProvider(string provider){
  pNetProvider = pnetworkprovider;
}

/* disabled status of provider on location
---------------------------------------------
Usage: sets the Present net provider to an empty string
*/
public void disabledProvider(string provider){
  pNetProvider = "";
}

/* asking for permission function
------------------------------------
Usage: function is used to ask user for permission to access gps location
*/
void permissionGrant(){

}

//set starting variables
boolean locationFlag = false;
string pNetProvider = "";

float pLat = 0;
float plong = 0;
float pAccurate = 0;

/* MAIN FUNCTION
---------------------------
Usage:
*/
void setup() {
  
  
}
void draw(){
  
}

  