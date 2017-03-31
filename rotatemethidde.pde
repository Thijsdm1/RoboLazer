

PImage laser;
float draaihoek;

PImage  robot, achtergrond, gear;
static final int DIAM = 48, SPD = 3, FPS = 60;
int start, fotoX = (int)random(200,800), fotoY = (int)random(200,800), timer;
String time = "010";
int startLaser;
int laserTimer;
int laserxrij1 = 10;
int laser1y = 400;
int laser2y = 200;
 
Player p;
 
void setup() {
  size(600, 600);
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
    laserRotate();
    gearTimer();
  laserTimer();
  placeLaser();
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
  if(laserTimer >= 5){
  image(laser,laserxrij1,laser1y);
  }
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