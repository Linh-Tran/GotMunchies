String inputString = "";
boolean done = false;

void drawInputBox(){
     PFont font = createFont("arial",20);

  cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
                 
}
public void input(String theText) {
  //and open next map!
   cp5.hide();

  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}