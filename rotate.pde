PImage laser;
float draaihoek;


void setup()
{
  laser = loadImage("laser.png");
  size(600, 600);
  draaihoek = 0;
  smooth();
  fill(192);
  noStroke();
  image(laser,400,400);
  
 
}
void draw(){
  
  background(255);
  laserRotate();
  
  
}
void laserRotate(){
 draaihoek= draaihoek + 0.4;
  //keyPressed();
 pushMatrix();
  translate(445,422);
  rotate(radians(draaihoek));
  fill(120);
  pushMatrix();
  translate(-27,-22);
   image(laser,0,0);
   popMatrix();
  popMatrix(); 
  
  
}