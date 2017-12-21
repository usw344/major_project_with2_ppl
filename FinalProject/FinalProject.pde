// Muhammad and kam major project
// Due Jan
// button objecy by Muhmmad
// stickman Object by kam
// both worked heavily on levelLoader

// what works right now
//you can expand
//primative fighting is also there



//loading our objects
Stickman humanPlayerStickMan,aiControledStickMan;
Weapon w1;
LevelLoader lvl1;
Button startButton, helpButton;
WeaponType weapon1;
Ammo arrow;
Shop firstShop;

int turn;

float theWeaponLevel;


// images for the resource bar at the bottom and hut
PImage ourHut,theGoldBar,back;

//the state
int state;


void setup() {
  //switch between full screen and normal WARNING DO NOT USE FULLSCREEN FOR DEBUGGING
  size(625, 625);
  //fullScreen();
  
  state = 3;
  
  turn = 0;
  // starts the constructor for the objects
  objectLoader();
  
  theGoldBar = loadImage("gold.png");
  back = loadImage("Plains.jpg");
  
  theWeaponLevel = 0.1;
  


}


void draw() {
  background(255);


  if (state == 0) { // intro screne
    startScreen(); // all the buttons for the first screen
    helpButtonCode(); // instructions for the game
  } 
  
  else if (state == -1) {
    helpScreen();// coming soon a help screen
  } 
  
  else if (state == 1) { // grid game


    if(turn == 0) {
      lvl1.showBoard();
    }
    else if(turn == 1) {
      lvl1.aiHandler();
      turn = 0;
    }
    fill(0);
    drawResourceBar();
  } 
  
  else if (state == 2) { // stick man fight
    image(back,width/2,height/2,width,height);
    handleStickerman();// all the code for the stick square battle
    weaponHandler();
    weapon1.myDraw();

  }
  else if(state == 3){
    firstShop.display();
    
  }
}


///////////////////////////////////////////////// all code for the buttons
void startScreen() {
  background(255);
  startButton.displayButton(width/2, height/4, width/3, height/5);
  
  startButton.isTheButtonBeingClicked(1);// go to the game when clicked
  
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









/////////////////////////////////////////////////////////////////////////// code involing the stickman
void handleStickerman() { // sets up the stickman and starts the moving;
  //human plauer
  humanPlayerStickMan.display();
  
  humanPlayerStickMan.movement();
  
  //ai player
  aiControledStickMan.display();
  
  aiControledStickMan.ai(humanPlayerStickMan); //passing in the human stickman to be used in the ai
  
  aiControledStickMan.healthBar();

}

void weaponHandler() {
  weapon1.display();
  weapon1.move(humanPlayerStickMan.x,humanPlayerStickMan.y);
  weapon1.attack(aiControledStickMan);
  
  //arrow.fire();
}

/// this makes the stickman move;
void keyPressed() {
  humanPlayerStickMan.handleKeyPress();
  
}

void keyReleased() {
  humanPlayerStickMan.handleKeyRelease();
  
  
}

void mousePressed() {
  lvl1.mouseHandler(); // triggers the char to move. ALL THE MAJOR CODE FOR CHAR

}



//////////////////////////////////////  background functions such as loading objects
void objectLoader() {
  lvl1 = new LevelLoader("0.txt"); //load whichever level you want hint make your own if you want

  humanPlayerStickMan = new Stickman();
  
  aiControledStickMan = new Stickman(4*width/5);
  
  w1 = new Weapon();

  startButton = new Button();

  helpButton = new Button();
  
  weapon1 = new WeaponType(5, 1 , 15 , "gun.jpg", 2, humanPlayerStickMan.x + humanPlayerStickMan.x/12  , humanPlayerStickMan.y,humanPlayerStickMan.w*2,humanPlayerStickMan.h);
  
  firstShop = new Shop(2,3);
}


void drawResourceBar() {
  
  //where to draw the black bar at the bottom of the screen
  float barY = height-lvl1.tileHeight;
  float barWidth = width;
  float barHeight = lvl1.tileHeight;
  
  // floats for the gold bar PImage
  float goldBarX = width-width/3;
  float goldBarW = lvl1.tileWidth;
  float goldBarH =lvl1.tileHeight;
  

  rect(0,barY,barWidth,barHeight);// drawing the black bar at the bottom


  image(theGoldBar,goldBarX,barY,goldBarW,goldBarH);// drawing the gold sprite
  
  fill(255);// want white for the text with size 24
  textSize(24);
  
  // all the text you find on the resource bar
  text("= ",goldBarX + 40,barY+goldBarH/2+5);// just the word gold
  
  text(lvl1.amountOfGold,goldBarX + 80,barY+goldBarH/2+5); // amount of gold you have as of this turn
  
  text("turn",goldBarX/2 - width/16,barY+goldBarH/2+5); // just the word turn
  
  text(lvl1.turnCounter,goldBarX/2 - width/16 + 80,barY+goldBarH/2+5);// how many turns have passed
}