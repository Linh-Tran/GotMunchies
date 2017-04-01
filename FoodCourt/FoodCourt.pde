import processing.net.*;
import java.util.*;
//kim is comment
Server myServer;
int val = 0;
List<Client> customerInLine;

void setup() {
  size(200, 200);
  // Starts a myServer on port 5204
  myServer = new Server(this, 5204); 
  customerInLine = new ArrayList<Client>();
  openStore();
}

void openStore(){
  while(true){
    Client customer = myServer.available();
    if(customer!=null){
      String order = customer.readString();
      if(order.contains(",")) updateMenu();
      else if(order.contains("New Customer")) 
    }
  }
}

/*
* Update all the customer's map
*/
void updateMenu(){
  
}