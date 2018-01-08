//Made by Kam
class Stickman {
  float x, y, dx, dy, w, h,current;
  int health;
  PImage plains;
  boolean movingRight, movingLeft, engageAi, shootWhichWay;
  PImage sticky;

//constructor
  Stickman() {
    //setting up where the stickman will be
    x = width/16;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/6;
    h = height/3;
    
    // setting all the movment booleans to false. 
    movingLeft = false;
    movingRight = false;
    
    //loading up the stickman
    sticky = loadImage("Sticky.png");
    engageAi = false;// this is human controled so no ai
    health = 100;
  }
  Stickman(float _x) {// second constructor for the enemy one. (no movement boolean and diffeent draw lcoation)
    //setting up enemy localtion
    x = _x;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/6;
    h = height/3;
    
    //loading its place
    sticky = loadImage("Sticky.png");
   
    engageAi = true;//the computer will controll this one
    health = 100;
  }


  void display() {
    println("false");
    imageMode(CENTER);
    image(sticky,x,y,w,h);//the stickman PImage
  }
  
  void whichWayAmIFacing(int theX) {
    if (x >= theX) {
      shootWhichWay = true;
    }
    else {
      shootWhichWay = false;;
    }
  }
  
  
  
//////////////////////////////////////////////////////this is all the code for handling the movement of the stickman
  void movement(float currentSpeed) {
    dx = currentSpeed;
    if (movingLeft) {
      println(dx);
      x -= dx;
    }
    if (movingRight) {
      x += dx;
    }
  }

////////////////////////////////////////////////////////////////////////// dealing with keyPressed and released
  void handleKeyPress() {// used with the keyPressed in the main file
    if (key == 'a') {
      movingLeft = true;
    }
    if (key == 'd') {
      movingRight = true;
    }
  }

  void handleKeyRelease() {
    if (key == 'a') {
      movingLeft = false;
    }
    if (key == 'd') {
      movingRight = false;
    }
  }

//////////////////////////////////////
  void ai(Stickman humanPlayer) {
    float humanX, humanY;
    float speedToMove = 3;
    
    humanX = humanPlayer.x;
    humanY = humanPlayer.y;
    
    if(humanX + w/2 >= x - w/2 && humanX - w/2 <= x + w/2 && humanY + h/2 >= y - h/2 && humanY - h/2 <= y + h/2){ // to check if range of the other stickman and hit it
      healthBar(); 
  }
    
    else {
      // very simple ai just moves towards the humanPlayer
      if(humanPlayer.x < x) {
        x -= speedToMove;
      }
      else if(humanPlayer.x > x) {
        x += speedToMove;  
      }
      
      if(humanPlayer.y > y) {
        y += speedToMove;
      }
      
      else if(humanPlayer.y < y ){
        y -= speedToMove;
      }
    }
  }

void healthBar() {

  //drawing a rect based on your current health
  colorOfHealth(health);
  rect(width/10,height/8,health*5, height/25);
  
  if (health <= 0) {
    state = 1;// when the battle end go back to grid
    health = 100;
    
  }
  
  fill(0);
  textSize(32);
  
  text(health,width/10,height/8+100);

  }
}

void colorOfHealth(int health) {
  if (health > 66) {
    fill(0,255,5);
  }
  else if ( health > 33) {
    fill(255,141,0);
  }
  else {
    fill(255,0,0);
  }
}