import processing.net.*; 
import java.util.*;

Client customer; 
private String ID;
private List<String> coordinates;
public boolean ready = true; 
 
 
 void sendLocation(String GPS, String msg){
   customer.write(newLocation + GPS + ";" + msg + "\n");
 }
 
void setup() { 
    fullScreen();

  customer = new Client(this, "127.0.0.1", 5204); 
  coordinates = new ArrayList<String>();
  customer.write(newCustomer+"Hello World\n");
  ID = idPrefix+"Hello World";
  //customer.write(newLocation+"1314242\n");
} 
void draw(){
  drawMainScreen();
  if(customer.available() > 0 && ready)
  {
    ready = false;
    String message=null;
    while(message==null){
      message = customer.readStringUntil('\n');
    }
    message = message.replaceAll("\n","");
    if(message.length()>0){
      if(message.contains(ID) || message.contains(everyone))//message targeted
      {
        if(message.contains(newLocation)){
          message = message.replace((message.contains(everyone)?everyone:ID)+" "+newLocation, "");
          String[] temp = message.split(";");
          String GPStemp = temp[0];
          String Msgtemp = temp.length>=1?"":temp[1];
          
          coordinates.add(message);
          print(GPStemp+"\n");
          
        }
        else if(message.contains(logout)){
          customer.stop();
        }
        else if(message.contains(cardDecline)){
          print("Please try again");
        }
        else if(message.contains(cardAccepted)){
          print("Thank you, come again :)!");
        }
        
      }
    }
   
  }
}


 