 import processing.net.*;
 import processing.serial.*;
/*
 * Interface for notifying Customers
 */

 interface Notification{
   void sendLocation();
   void sendMessage();
   void printMessage(String msg);
   void parseUserInput(Client customer);
 }
 
 //class Notify implements Notification {
 //  Serial port;
 //  void sendLocation(){
 //    float x, y, z = 0;
 //  }
 //  void sendMessage(){
 //    String msg;
 //  }
 //  void printMessage(String msg){
 //    System.out.println(msg);
 //  }
 //  void parseUserInput(Client customer){
 //    while(port.available()>0){
 //      String buffer = port.readString();
 //      if(buffer!=null){
 //        printMessage(buffer);
 //      }
 //    }
 //  }
 //}
 

 