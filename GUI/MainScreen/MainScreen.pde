
void setup(){
  fullScreen();
}
void draw() {
  //make a box
  background(#ED8F12);
  textSize(width/10);
    fill(0);
text("Hungry or Stuffed?", width/20, height/3);

fill(0);
rect(width-width/10-width/3,height-height/3,width/3,height/5);
fill(0);
rect(width/10,height-height/3,width/3,height/5);

 textSize(width/15);
fill(#ED8F12);
text("search",width/6,height-height/3,width,height);

fill(#ED8F12);
text("eat",width-width/10-width/4.5,height-height/3,width,height);
//rect(20,20,width,height);

  if (mousePressed) {
    //this is hungry
    if (mouseX < width/2) {
      //run function
      rect(0, 0, width/2, height); // Left
      //this is stuffed
    } else {
      //run function
      rect(width/2, 0, width/2, height); // Right
    }
  }
}