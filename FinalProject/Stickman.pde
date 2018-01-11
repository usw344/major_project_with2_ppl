//Made by Kam
class Stickman {
  float x, y, dx, dy, w, h,current, aiAttack;
  int health;
  PImage plains;
  boolean movingRight, movingLeft, engageAi, shootWhichWay, jump, movingUp, movingDown;
  PImage sticky;
  
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
    sticky = loadImage("Sticky.png");
    engageAi = false;// this is human controled so no ai
    health = 100;
    
   
  }
  Stickman(float _x, float _speed, float attack,String imageOfAi) {// second constructor for the enemy one. (no movement boolean and diffeent draw lcoation)
    //setting up enemy localtion
    x = _x;
    y = height/2;
    dx = _speed;
    dy = _speed;
    w = width/6;
    h = height/3;
    
    aiAttack = attack;
    
    //loading its place
    sticky = loadImage(imageOfAi);
   
    engageAi = true;//the computer will controll this one
    health = 100;
    
    aiWeapon = new WeaponType(attack,0,0, "Crossbow.png", 1, 1 , x*10,y*10,w *10,h*10);
    
  }


  void display() {
    imageMode(CENTER);
    image(sticky,x,y,w,h);//the stickman PImage
  }
  
  void aiWeaponHandler(Stickman _theHumanAiToattack){
    aiWeapon.display(x);
    aiWeapon.move(x,y);
  
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
    if(jump){
      if(y < 100){
      jump = false;
     } 
      
      y -= 10;
      
    }
    else if (jump == false && y < height/2){
      y += 10;
    
    }
    if (movingRight) {
      x += dx;
    }
    if(movingUp){
      y -= dy;
    }
    if(movingDown){
      if(y < height - h/2 )
        y += dy;
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
    if(key == ' '){
      jump = true;
    
    }
    if(key == 'w'){
      movingUp = true;
    }
    if(key == 's'){
      movingDown = true;
    }
  }

  void handleKeyRelease() {
    if (key == 'a') {
      movingLeft = false;
    }
    if (key == 'd') {
      movingRight = false;
    }
    if(key == 'w'){
      movingUp = false;
    }
    if(key == 's'){
      movingDown = false;
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

}




 