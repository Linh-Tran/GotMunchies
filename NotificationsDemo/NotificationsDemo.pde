PFont font;
boolean alert = false;
String userID = "bob";
String locName = "sub";
String description = "Free Pizza";

void setup()
{
  size(400, 200);
  smooth();
  font = createFont("Arial", 20);
  textFont(font);
}
void draw()
{
  background(255, 0, 0);
  if(alert){
    text( "New Notification\n" + "Location: " + locName + "\n" + description, width/2, height/2);
  }
}

void keyPressed()
{
  if(key == 's'){
    alert = true;
  }
}