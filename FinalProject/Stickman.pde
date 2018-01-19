//Made by Kam
class Stickman {
  float x, y, dx, dy, w, h,current, aiAttack;
  int health,lives;
  PImage plains;
  boolean movingRight, movingLeft, engageAi, shootWhichWay, jump, movingUp, movingDown,facingL,youLost;
  PImage sticky,invertImg;
  
  WeaponType aiWeapon;
  
  Ammo aiAmmo;

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
    jump = false;
    movingUp = false;
    movingDown = false;
    
    //loading up the stickman
    sticky = loadImage("You.png");
    invertImg = loadImage("YouL.png");
    engageAi = false;// this is human controled so no ai
    health = 100;
    facingL = false;
    youLost = false;
    lives = 5;
    
   
  }
  Stickman(float _x, float _speed, float attack,String imageOfAi, String imageInverted, boolean isFacingL) {// second constructor for the enemy one. (no movement boolean and diffeent draw lcoation)
    //setting up enemy localtion
    x = _x;
    y = height/2;
    dx = _speed;
    dy = _speed;
    w = width/3;
    h = height/3;
    facingL = isFacingL;
    invertImg = loadImage(imageInverted);
    
    aiAttack = attack;
    
    //loading its place
    sticky = loadImage(imageOfAi);
   
    engageAi = true;//the computer will controll this one
    
    health = 100;
    
    aiWeapon = new WeaponType(attack,0,0, "Crossbow.png", 1, 1 , x*11,y*11,w *10,h*10,"CrossbowL.png");
    
    youLost = false;
    
    lives = 5;
    
  }


  void display() {
    imageMode(CENTER);
    
    // finds which image of you to load. (meaning which way you are facing)
    if (facingL == false) {
      image(sticky,x,y,w,h);//the stickman PImage
    }
    else {
      image(invertImg,x,y,w,h);
    }
}
  

//////////////////////////////////////////////////////this is all the code for handling the movement of the stickman
  void movement(float currentSpeed) {// current speed is taken from the shop
    dx = currentSpeed;
    if (movingLeft) {
      x -= dx;
    }
    if(jump){// a very basic jump 
      if(y < 100){
      jump = false;// after reaching a max height of 100
     } 
      
      y -= 10;
      
    }
    else if (jump == false && y < height/2){
      y += 10;
    
    }
    if (movingRight) {
      x += dx;
    }
  }

////////////////////////////////////////////////////////////////////////// dealing with keyPressed and released
  void handleKeyPress() {// used with the keyPressed in the main file
    if (key == 'a') {
      movingLeft = true;
      facingL = true;
    }
    if (key == 'd') {
      movingRight = true;
      facingL = false;
    }
    if(key == ' '){
      jump = true;
    
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
    float speedToMove = dx;
    
    // done to make collsion detection easier
    humanX = humanPlayer.x;
    humanY = humanPlayer.y;
 
    if(humanX + w/2 >= x - w/2 && humanX - w/2 <= x + w/2 && humanY + h/2 >= y - h/2 && humanY - h/2 <= y + h/2){ // to check if range of the other stickman and hit it      
      humanPlayer.health -= 10;// if ai hits human do damage
      
      humanPlayer.x -= 20;// pushes human back
      
      x = 600;// puts ai back at starting point
    }

    // very simple ai just moves towards the humanPlayer
    if(humanPlayer.x < x) {
      x -= speedToMove;
      facingL = false;
      }
    
    else if(humanPlayer.x > x) {
      x += speedToMove;
      facingL = true;
      }
      
    if(humanPlayer.y > y) {
      y += speedToMove;
      }
    
    else if(humanPlayer.y < y ){
       y -= speedToMove;
      } 
    }
  

void healthBar() {

  //drawing a rect based on your current health
  fill(0);
  textSize(32);
  
  text(health,x,y - h/2 - h/3);
  
  colorOfHealth(health);// to calculate the color
  rect(x, y - h/2,health*2,25);
  
  if (health <= 0) {
    state = 1;// when the battle end go back to grid
    health = 100;
    
  }
  
  
  }


 void colorOfHealth(int health) {
    if (health > 66) { // green
      fill(0,255,5);
    }
    else if ( health > 33) { // redis
      fill(255,141,0);
    }
    else {
      fill(255,0,0);// red
    }
 }
 
 void theEnd(Stickman humanPlayer) {
   if (humanPlayer.health <= 0) {
     lives-=1;
     if (lives <=0) {
       youLost = true;// game over
     }
   }
 }

}




 