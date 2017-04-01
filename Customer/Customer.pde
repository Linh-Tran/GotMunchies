import processing.net.*; 
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

Client customer; 
private String ID;
private List<String> coordinates;
public AtomicBoolean ready = new AtomicBoolean(true); 
 
 
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
  if(customer.available() > 0 && ready.compareAndSet(true,false))
  {
    try {
      String message=null;
      while(message==null){
        message = customer.readStringUntil('\n');
      }
      message = message.replaceAll("\n","");
      if(message.length()>0){
        if(message.contains(ID) || message.contains(everyone))//message targeted
        {
          if(message.contains(newLocation)){
            message = message.replace((message.contains(everyone)?everyone:ID), "");
            message = message.replace(newLocation, "");
            message = message.trim();
            String[] temp = message.split(";");
            println(temp[0]+" "+temp[1]);
            String GPStemp = temp[0];
            String Msgtemp = temp.length<1?"":temp[1];
            coordinates.add(message);
            print(GPStemp+" "+Msgtemp+"\n");
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
    } catch(Exception e){
      e.printStackTrace();
    } finally {
      ready.set(false);
    }
  }
}


 