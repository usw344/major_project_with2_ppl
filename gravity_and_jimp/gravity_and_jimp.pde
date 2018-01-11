float x, y, dy, gravity, ground;

void setup() {
  size(600, 600);
  ground = height - 25;
  x = width/2;
  y = ground;
  dy = 0;
  gravity = 0.1;
}

void draw() {
  background(0);

  moveBall();
  displayBall();
}

void jump() {
  dy = -3;
}

void displayBall() {
  ellipse(x, y, 50, 50);
}

void moveBall() {
  if (y > ground) {
    y = ground;
    dy = 0;
  } else {
    dy += gravity;
  }
  y += dy;
}

void keyPressed() {
  jump();
}