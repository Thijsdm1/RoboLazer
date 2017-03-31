ArrayList <Bullet> bullets;//where our bullets will be stored
 PImage laser;
 
void setup()
{
  laser = loadImage("laser.png");
  size(800,800);
  bullets = new ArrayList();
}
void draw()
{
  background(255);
  

  image(laser,50,80);
  removeToLimit(25);//some other code that removes bullets if there are too many on screen
  
  moveAll();//move all the bullets
  displayAll();//display all the bullets
}
class Bullet//bullet class
{
  float x;
  float y;
  float speed;
  Bullet(float tx, float ty)
  {
    x = tx;
    y = ty;
  }
  void display()
  {
    stroke(0);
    fill(0);
    ellipse(x,y,10,10);
  }
  void move()
  {
    y -= 2;
  }
}
 
void removeToLimit(int maxLength)
{
  while(bullets.size() > maxLength)
  {
    bullets.remove(0);
  }
}
void moveAll()
{
  for(Bullet temp : bullets)
  {
    temp.move();
  }
}
void displayAll()
{
  for(Bullet temp : bullets)
  {
    temp.display();
  }
}
void mousePressed()//add a new bullet if mouse is clicked
{
  Bullet temp = new Bullet(mouseX,mouseY);
  bullets.add(temp);
}