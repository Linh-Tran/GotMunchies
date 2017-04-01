import processing.net.*; 
import java.util.*;
import controlP5.*;

ControlP5 cp5;
ControlP5 introPage;
Client customer; 
private String ID;
private List<String> coordinates;
public boolean ready = true; 
 
 
 void sendLocation(String GPS, String msg){
   print(GPS+msg);
   customer.write(newLocation + GPS + ";" + msg + "\n");
 }
 
void setup() { 
  fullScreen();
  cp5 = new ControlP5(this); //inputbox
  introPage = new ControlP5(this);
  customer = new Client(this, "127.0.0.1", 5204); 
  coordinates = new ArrayList<String>();
  customer.write("New Customer: Hello World\n");
  ID = idPrefix+"Hello World";
  ready = true;
  customer.write("GPS: 1314242\n");
  cp5 = new ControlP5(this);
  cp5.hide();

    drawInputBox();

} 

void draw(){
    drawMainScreen();

  if(customer.available() > 0 && ready)
  {
    String message=null;
    while(message==null){
      message = customer.readStringUntil('\n');
    }
    message = message.replaceAll("\n","");
    if(message.contains(ID) || message.contains(everyone))//message targeted
    {
      if(message.contains(newLocation)){
        message = message.replace((message.contains(ID)?ID:everyone)+newLocation, "");
        message = message.replace(newLocation, "");
        message = message.trim();
        String[] temp = message.split(";");
        String GPStemp = temp[0];
        String Msgtemp = temp.length>=1?"":temp[1];
        
        coordinates.add(message);
        print(GPStemp+" "+Msgtemp);
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
      ready = false;
    }
   
  }
}


 