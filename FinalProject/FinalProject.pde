Stickman s1;
LevelLoader lvl1;
void setup() {
  size(625,625);
  //fullScreen();
  lvl1 = new LevelLoader("/levels/0.txt");


  s1 = new Stickman();
  


}


void draw() {
  background(0);
  //handleStickerman();
  lvl1.showBoard();

  

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