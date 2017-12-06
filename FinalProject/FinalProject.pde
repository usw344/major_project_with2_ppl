// work on this on the weekend
// find out why the bottom row does not work

// comment stuff
// ai
// turn 
// BATTLE





Stickman s1,e1;
Weapon w1;
LevelLoader lvl1;
Button startButton, helpButton;
PImage ourHut;

int move;
int state;


void setup() {
  size(625, 625);
  //fullScreen();
  state = 0;
  objectLoader();
  move = 1;
}


void draw() {
  background(255);
  //println("false");

  if (state == 0) { // intro screne
    startScreen();
    helpButtonCode();
  } 
  else if (state == -1) {
    helpScreen();
  } 
  else if (state == 1) { // grid game
    lvl1.showBoard();
    lvl1.moveCharch();
  } 
  else if (state == 2) { // stick man fight
    handleStickerman();
  }
}


void startScreen() {
  background(255);
  startButton.displayButton(width/2, height/4, width/3, height/5);
  startButton.isTheButtonBeingClicked(1);
  startButton.theText("Start");
}

void helpButtonCode() {
  helpButton.displayButton(width/2, height- height/4, width/3, height/5);
  helpButton.isTheButtonBeingClicked(-1);
  helpButton.theText("HELP!!");
}

void  helpScreen() {
  text("dont knwo yet to play the game", width/2, height/2);
}


void handleStickerman() { // sets up the stickman and starts the moving;
  s1.display();
  s1.movement();
  e1.display();
  e1.ai(s1);
  e1.healthBar();


}

void objectLoader() {
  lvl1 = new LevelLoader("0.txt");

  s1 = new Stickman();
  e1 = new Stickman(4*width/5);
  w1 = new Weapon();

  startButton = new Button();

  helpButton = new Button();
}


/// this makes the stickman move;
void keyPressed() {
  s1.handleKeyPress();
}

void keyReleased() {
  s1.handleKeyRelease();
  
}


void mousePressed() {
  lvl1.mouseHandler(); // triggers the char to move. ALL THE MAJOR CODE FOR CHAR

}