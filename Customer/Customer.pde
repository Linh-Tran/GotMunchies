import processing.net.*; 

Client customer; 
private String ID;
 
void setup() { 
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  customer = new Client(this, "127.0.0.1", 5204); 
  customer.write("New Customer: Hello World\n");
  ID = idPrefix+"Hello World";
  running();
} 
void running(){
  if(customer.available() > 0)
  {
    String message=null;
    while(message==null){
      message = customer.readStringUntil('\n');
      print(message);
    }
  }
}


 