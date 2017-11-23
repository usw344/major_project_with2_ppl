//Made by Kam
class Weapon {
  float x,y,w,h,dx,dy;
  boolean movingUp, movingDown, movingRight, movingLeft;
  
  //constructor
  Weapon() {
    x = width/15.75;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/100;
    h = height/50;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    movingUp = false;
  }
  
  void display() {
    rectMode(CENTER);
    fill(0,249,255);
    rect(x, y, w, h);
  }
  
  //this is what allows the weapon to move around with the character
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
}