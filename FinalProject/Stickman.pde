class Stickman {
  float x, y, dx, dy, w, h;

  Stickman() {
    x = width/16;
    y = height/2;
    dx = 5;
    dy = 5;
    w = width/100;
    h = height/100;
  }

  void display() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void movement() {
    if (keyPressed == true) {
      if (key == 'w') {
        if (y != h/2) {
          y -= dy;
        }
      } else if (key == 's') {
        if (y != height-h/2) {
          y += dy;
        }
      } else if (key == 'a') {
        if (x != w/2) {
          x -= dx;
        }
      } else if (key == 'd') {
        if (x != width-w/2) {
          x += dy;
        }
      }
    }
  }
}