// imports
import android.location.Location;
import android.location.locListener;
import android.location.LocManager;
import android.content.Context;
import android.os.Bundle;
import android.Manifest;

// setting elements
ManageLocation locManager;
ListenLocation locListener;

class ListenLocation implements locListener{
  public void locChange(Location location){
    pNetProvidor = location.getNetProvidor();
    
    float pLat = location.getLat();
    float pLong = location.getLong();
    float pAccurate = location.getAccurate();
  }

//status of providor on location
public void enabledProvider(string providor){
  pNetProvidor = providor;
}

public void disabledProvidor(string providor){
  pNetProvidor = "";
}


//set starting variables
boolean locationFlag = false;
string pNetProvider = "";

float pLat = 0;
float plong = 0;
float pAccurate = 0;

//main function
void setup() {
  size(480,640);
  orientation(PORTRAIT);
}
void draw(){
}

void permissionGrant(){
  Context contxt = surface.getContext();
  locationListener = new MyLocationListener();
  locManager = (LocationManager) context.getSystemService(context.LOCATION_SERVICE);
  locManager.requestLocatonUpdates(LocationManager.NETWORK_PROVIDER, 0, 0, locListener);
  