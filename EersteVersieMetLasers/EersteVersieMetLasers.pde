 int schietsnelheid = 5;
int snelheid = 1;
PImage laser;
float draaihoek;
int eersteSchot = 0;
ArrayList <BulletRechts> bullets;

PImage  robot, achtergrond, gear;
static final int DIAM = 48, SPD = 3, FPS = 60;
int start, fotoX = (int)random(200,800), fotoY = (int)random(200,800), timer;
String time = "010";


int startLaser;
int laserTimer;
int laserxrij1 = 10;
int laser1y = 400;
int laser2y = 200;
int laser3y = 20;
int laser3x = 200;
int laser4x = 400;

 
Player p;
 
void setup() {
  size(600, 600);
  bullets = new ArrayList();
  int tijdTussen = 5;
  int aantalKogels = 100;
  
  laser = loadImage("laser.png");
  gear = loadImage("gear2.png");
  robot = loadImage("robot_up.png");
  achtergrond = loadImage("achtergrond.jpg");
  
  draaihoek = 0;
  smooth(4);
  frameRate(FPS);
  start = (millis()/1000);
   startLaser = (millis()/1000);
  
 


  p = new Player(width>>1, height>>1, DIAM, SPD);
}
 
void draw() {
  background(achtergrond);
  p.move();
  p.display();
  //laserRotate();
  gearTimer();
  laserTimer();
  
  placeLaser();
  
  //Bullet functiesll
  
  moveAll();
  displayAll();
}
void keyPressed() {
  p.setMove(keyCode, true);
}
 
void keyReleased() {
  p.setMove(keyCode, false);
}
 
final class Player {
 
  boolean isLeft, isRight, isUp, isDown;
  int x, y;
  final int d, v;
 
  Player(int xx, int yy, int dd, int vv) {
    x = xx;
    y = yy;
    d = dd;
    v = vv;
  }
 
  void display() {
    image(robot, x, y);
  }
 
  void move() {
    int r = d>>1;
    x = constrain(x + v*(int(isRight) - int(isLeft)), r*(2), width  - r*(2));
    y = constrain(y + v*(int(isDown)  - int(isUp)),   r*(2), height - r*(2));
  }
 // vermenigvuldig r met een getal om de grenzen voor de robot te veranderen.
  boolean setMove(int k, boolean b) {
    switch (k) {
    case 'Z':
    case UP:
      return isUp = b;
 
    case 'S':
    case DOWN:
      return isDown = b;
 
    case 'Q':
    case LEFT:
      return isLeft = b;
 
    case 'D':
    case RIGHT:
      return isRight = b;
 
    default:
      return b;
    }
  }
}
void laserTimer() {
  laserTimer = (millis()/1000)-startLaser;  
   text(laserTimer, 40, 40);
}
void placeLaser(){
  if(laserTimer >= 1){
    //binnenRollenX(laserxrij1,400);
   image(laser,laserxrij1,laser1y);
   generateBullet(laserxrij1,laser1y);
  }
  if(laserTimer >= 2){
  image(laser,laserxrij1,laser2y);
  }
  if (laserTimer>= 3){
    laserRotateStill(laser3x,laser3y,90);
  }
  if (laserTimer >= 4){
   laserRotateStill(laser4x,laser3y,90);
  }
  }
    
 void laserRotateStill(int x,int y,int degrees){
      pushMatrix();
  translate(x,y);
  rotate(radians(degrees));
  fill(120);
  pushMatrix();
  translate(-27,-22);
   image(laser,0,0);
   popMatrix();
  popMatrix();
    pushMatrix();
  rotate(radians(180));
  image(laser,laser3x,laser3y);
  popMatrix();
}
void gearTimer(){
  timer = (millis()/1000)-start;
  text(timer, 20, 20);
  if((millis()/1000) > start+4){
      start = (millis()/1000);
      fotoX = (int)random(50, 550);
      fotoY = (int)random(50, 550);
    // fotox en fotoy zorgen voor een willekeurige x en y coordinaat  
    //voor de foto tussen de 200 en 800 pixels
    // elke 4 seconden begint het opnieuw
  }
  
  if (timer < 2) { //voor 2 seconden is het blokje er
          fill(0,255,0);
          image(gear, fotoX, fotoY);
          }
}          

/*void binnenRollenX(int eindx,int eindy) {
 
  for(int i= 0;i<20;i++){
    eindx = eindx-20;
    eindy = eindy-20;
    image(laser,eindx + i,eindx+ i);
  }
}*/

void laserRotate(){
 draaihoek= draaihoek + 1;
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

class BulletRechts {
  float x;
  float y;
 
  BulletRechts(float tx,float ty){
    x = tx;
    y = ty;
    
    
  }
  
  void display()
  {
    stroke(#FF0000);
     fill(#FF0000);
    ellipse(x,y,10,10);
  }
  void move()
  {
    x += snelheid;
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
  for(BulletRechts temp : bullets)
  {
    temp.move();
  }
}
void displayAll()
{
  for(BulletRechts temp : bullets)
  {
    temp.display();
  }
}
void generateBullet(int laserxcoord,int laserycoord)//add a new bullet if mouse is clicked
{
  if (timer ==0 && eersteSchot == 0){
  BulletRechts temp = new BulletRechts(laserxcoord,laserycoord);
  bullets.add(temp);
  eersteSchot = 1;
  }
  if (timer == 1){
    eersteSchot = 0;
  }
}
 