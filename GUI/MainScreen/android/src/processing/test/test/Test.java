package processing.test.test;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Test extends PApplet {

public void setup() {
  
  noStroke();
  fill(0);
}

public void draw() {
  background(0xffED8F12);
  textSize(width/10);

  text("Hungry? Stuffed?", width/2-width/3, height/2);

  if (mousePressed) {
    if (mouseX < width/2) {
      rect(0, 0, width/2, height); // Left
    } else {
      rect(width/2, 0, width/2, height); // Right
    }
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
