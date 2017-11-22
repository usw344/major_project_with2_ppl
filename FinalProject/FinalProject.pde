Stickman s1;

void setup() {
  size(500,500);
  //fullScreen();

  s1 = new Stickman();
  


}


void draw() {
  background(0);
  handleStickerman();

  

}

void handleStickerman() { // sets up the stickman and starts the moving;
  s1.display();
  s1.movement();


}


/// this makes the stickman move;
void keyPressed() {
  s1.handleKeyPress();

}

void keyReleased() {
 s1.handleKeyRelease(); 
}