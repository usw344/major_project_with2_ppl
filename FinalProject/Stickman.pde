//Made by Kam
class Stickman {
  float x, y, dx, dy, w, h,current;
  int health;
  boolean movingUp, movingDown, movingRight, movingLeft, engageAi;
  PImage sticky;

//constructor
  Stickman() {
    x = width/16;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/6;
    h = height/3;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    movingUp = false;
    sticky = loadImage("Sticky.png");
    engageAi = false;
    health = 100;
  }
  Stickman(float _x) {
    x = _x;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/6;
    h = height/3;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    movingUp = false;
    sticky = loadImage("Sticky.png");
    engageAi = true;
    health = 100;
  }


  void display() {
    imageMode(CENTER);
    image(sticky,x,y,w,h);//the stickman PImage
  }
  
  
//this is all the code for handling the movement of the stickman
  void movement() {
    if (movingUp) {
      if (y > h/2) {
        y -= dy;
      }
    }
    if (movingDown) {
      if (y < height-h/2) {
        y += dy;
      }
    }
    if (movingLeft) {
      if (x > w/2) {
        x -= dx;
      }
    }
    if (movingRight) {
      if (x < width-w/2) {
        x += dy;
      }
    }
  }


  void handleKeyPress() {
    if (key == 'w') {
      movingUp = true;
    }
    if (key == 's') {
      movingDown = true;
    }
    if (key == 'a') {
      movingLeft = true;
    }
    if (key == 'd') {
      movingRight = true;
    }
  }

  void handleKeyRelease() {
    if (key == 'w') {
      movingUp = false;
    }
    if (key == 's') {
      movingDown = false;
    }
    if (key == 'a') {
      movingLeft = false;
    }
    if (key == 'd') {
      movingRight = false;
    }
  }


  void ai(Stickman humanPlayer) {
    float humanX, humanY, humanWidth,humanHeight;
    humanX = humanPlayer.x;
    humanY = humanPlayer.y;
    humanWidth = humanPlayer.w;
    humanHeight = humanPlayer.h;
    float speedToMove = 3.5;
    if(humanX + w/2 >= x - w/2 && humanX - w/2 <= x + w/2 && humanY + h/2 >= y - h/2 && humanY - h/2 <= y + h/2){ // to check if range
      if(keyPressed && key == ' ') {
      x += 25;
      health -= 5;
      healthBar();
    }
    }
    else {
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
  //sets un the health bar
  float widthOfHealth;

  widthOfHealth = width/3;
  current = widthOfHealth;
  current = widthOfHealth * health/10;
  rect(width/10,height/8,health*5, height/25);
  if (health <= 0) {
    state = 1;
    health = 100;
    
  }
  fill(0);
  textSize(32);
  text(health,width/10,height/8+100);

}


}