import processing.net.*; 
import java.util.*;

Client customer; 
private String ID;
private List<String> coordinates;
 
 
 
 void sendLocation(String GPS, String msg){
   customer.write(newLocation + GPS + ";" + msg + "\n");
 }
 
void setup() { 
  customer = new Client(this, "127.0.0.1", 5204); 
  coordinates = new ArrayList<String>();
  customer.write("New Customer: Hello World\n");
  ID = idPrefix+"Hello World";
  customer.write("GPS: 1314242\n");
  customer.write(idPrefix + "Failed message!:\n");
} 
void draw(){
  if(customer.available() > 0)
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
        String[] temp = message.split(";");
        print(temp.length);
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
      
    }
   
  }
}


 