String inputString = "";
boolean done = false;

void drawInputBox(){
    PFont font = createFont("arial",height/10);

     cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(width/2,height/10)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
}
public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}