import processing.net.*;
import java.util.*;
//kim is comment
Server myServer;
Map<Client,String> customerInLine;
List<String> GPScoordinates = new ArrayList<String>();

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
      
      if(order.contains(newLocation)) broadcastMenu(everyone+order);
      else if(order.contains(newCustomer) && !customerInLine.containsKey(customer)){
          String name = order.substring(newCustomer.length());
          customerInLine.put(customer,name);
          broadcastMenu(idPrefix+name+newCustomer+name+"\n"+
          idPrefix+name+" Successful upload!");
          for(String gps:GPScoordinates) broadcastMenu(idPrefix+name+" "+newLocation+gps);
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
  myServer.write(message);
}