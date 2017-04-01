import processing.net.*; 

Client customer; 
 
void setup() { 
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  customer = new Client(this, "127.0.0.1", 5204); 
  customer.write("New Customer: Hello World");
  running();
} 

void running(){
  while(true)
  {
      if(customer.available() > 0)
      {
        
      }
  }
}


 