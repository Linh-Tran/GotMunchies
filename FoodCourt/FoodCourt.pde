import processing.net.*;
import java.util.*;
//kim is comment
Server myServer;
Map<Client,String> customerInLine;

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
      String order=null;
      while(order==null){
        order = customer.readStringUntil('\n');
      }
      print(order+"\n");
      
      if(order.contains(newLocation)) broadcastMenu(order);
      else if(order.contains(newCustomer)){
          print(order.substring(newCustomer.length()));
          customerInLine.put(customer,order.substring(newCustomer.length()));
          broadcastMenu("New Guy: "+order.substring(newCustomer.length())+"\n"+
          idPrefix+customerInLine.get(customer)+"Successful upload!");
      }
      else if(order.contains(logout)){
        broadcastMenu(idPrefix+customerInLine.get(customer)+" Logging out!");
        customerInLine.remove(customer);
        myServer.disconnect(customer);
      }
      else if(customerInLine.containsKey(customer))
      {
        broadcastMenu(idPrefix+customerInLine.get(customer)+" Failed message!");
      }
    }
  }
}

/*
* Update all the customer's map
*/
void broadcastMenu(String message){
  myServer.write(message+"\n");
}