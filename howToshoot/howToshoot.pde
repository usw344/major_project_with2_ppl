
float x, y, w, h, speed;
boolean moveIt;



void setup() {
  size(600, 600);

  moveIt = false;

  x = 50;
  y = 300;
  w = 50;
  h = 50;
}


void draw() {
  background(255);
  display();
  move();
}



void display() {
  fill(255, 0, 0);
  if (moveIt) {
    ellipse(x, y, w, h);
  }
}

void move() {
  if (moveIt) {
    x += 10; 
    y += 5;
    if (x > width) {
      x = 50;
      y = 300;
      moveIt = false;
    }
  }
}

void mousePressed() {
  if (mousePressed && moveIt == false) {
    moveIt = true;
  }
}