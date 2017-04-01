import processing.net.*; 
import java.util.*;

Client customer; 
private String ID;
private List<String> coordinates;
 
void setup() { 
  customer = new Client(this, "127.0.0.1", 5204); 
  coordinates = new ArrayList<String>();
  customer.write("New Customer: Hello World\n");
  ID = idPrefix+"Hello World";
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
        
      }
    }
    print(message);
  }
}


 