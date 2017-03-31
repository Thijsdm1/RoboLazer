PImage  robot, achtergrond, gear;
static final int DIAM = 48, SPD = 3, FPS = 60;
int start, fotoX = (int)random(200,800), fotoY = (int)random(200,800), timer;
String time = "010";
 
Player p;
 
void setup() {
  size(600, 600, JAVA2D);
  gear = loadImage("pictures/gear2.png");
  robot = loadImage("Pictures/robot_up.png");
  achtergrond = loadImage("Pictures/achtergrond.jpg");
  smooth(4);
  frameRate(FPS);
  start = (millis()/1000);
  imageMode(CENTER);
 


  p = new Player(width>>1, height>>1, DIAM, SPD);
}
 
void draw() {
  background(achtergrond);
  p.move();
  p.display();
  
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

// bron voor verbetering movement http://studio.processingtogether.com/sp/pad/export/ro.91tcpPtI9LrXp