class Stickman {
  float x, y, dx, dy, w, h;
  boolean movingUp, movingDown, movingRight, movingLeft;

  Stickman() {
    x = width/16;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/50;
    h = height/25;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    movingUp = false;
  }

  void display() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void movement() {
    if (movingUp) {
      if (y > h/2) {
          y -= dy;
        }
      if (y < height-h/2) {
          y += dy;
        }
      if (x > w/2) {
         x -= dx;
       }
     if (x < width-w/2) {
         x += dy;
       }
        
    }
  }

  void handleKeyPress() {
    if (key == 'w') {
      movingUp = true;
    }if (key == 's') {
      movingDown = true;
    }if (key == 'a') {
      movingLeft = true;
    }if (key == 'd') {
      movingRight = true;
    }
  }
  
  void handleKeyRelease() {
    if (key == 'w') {
      movingUp = false;
    }if (key == 's') {
      movingDown = false;
    }if (key == 'a') {
      movingLeft = false;
    }if (key == 'd') {
      movingRight = false;
    }
  }
}