//Made by Kam
class Stickman {
  float x, y, dx, dy, w, h;
  boolean movingUp, movingDown, movingRight, movingLeft, engageAi;
  PImage sticky;

//constructor
  Stickman() {
    x = width/16;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/12;
    h = height/6;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    movingUp = false;
    sticky = loadImage("Sticky.png");
    engageAi = false;
  }
  Stickman(float _x) {
    x = _x;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/12;
    h = height/6;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    movingUp = false;
    sticky = loadImage("Sticky.png");
    engageAi = true;
  }


  void display() {
    //rectMode(CENTER);
    image(sticky,x,y,w,h);//the stickman PImage
    //rect(x, y, w, h);
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
    float humanStickmanXBox, humanStickmanYBox;
    //humanStickmanXBox = 
    String test = ("e1 x is: " + x + "the human x is: " + humanPlayer.x );
    float speedToMove = 3;
    textSize(14);
    text(test, 200,300);
    if(x == humanPlayer.x && y == humanPlayer.y) { // to check if range
      text("hi",width/2,height/2);
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



}