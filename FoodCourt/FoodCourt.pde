import processing.net.*;
import java.util.*;
//kim is comment
Server myServer;
Map<Client,String> customerInLine;
private final String newCustomer = "New Customer: ";

void setup() {
  // Starts a myServer on port 5204
  myServer = new Server(this, 5204); 
  customerInLine = new HashMap<Client,String>();
  openStore();
}

void openStore(){
  while(true){
    Client customer = myServer.available();
    if(customer!=null){
      String order = customer.readString();
      print(order);
      if(order.contains(",")) broadcastMenu(order,"");
      else if(order.contains(newCustomer) 
        && !customerInLine.containsKey(customer)){
          customerInLine.put(customer,order.substring(newCustomer.length()));
          broadcastMenu("New Guy: "+order.substring(newCustomer.length()),"");
      }
      else{
        //send error messages to all the clients
      }
    }
  }
}

/*
* Update all the customer's map
*/
void broadcastMenu(String message, String name){
  if(name.length() > 0)
  {
    myServer.write("ID: "+name+", "+message);
    print("ID: "+name+", "+message);
  }
  else {
    myServer.write(message);
    print("ID: "+name+", "+message);
  }
}