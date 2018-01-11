// Muhammad and kam major project

// what needs finishing in board version
/// need to fix edges issues
/// need the ai to work better
/// need to make it so ai can not move on hills
/// need to add better graphics (kam)!!!

// what needs work in stickman fights
/// need to add ai attack
/// need to make the human stickman jump 
/// need to add obsticles and such to make battles more interesting
/// need concept of armour.
/// need to make ai health, speed, attack evolve with time

// what is needs to look better/ get a better grade
/// need to reorginze the classes
/// better overall graphics
/// needs sound and music


//loading our objects
Stickman humanPlayerStickMan,aiControledStickMan;
Weapon w1;
LevelLoader lvl1;
Button startButton, helpButton, shopButton, backButton;
WeaponType weapon1;
Ammo arrow;
Shop theShop; //firstShop;

int turn;

float theWeaponLevel;


// images for the resource bar at the bottom and hut
PImage ourHut,theGoldBar,back;

//the state
int state;

// for the stickman armour, attack and speed
float armour,attack,speed;

boolean shop;
void setup() {
  //switch between full screen and normal WARNING DO NOT USE FULLSCREEN FOR DEBUGGING
  size(625, 625);
  //fullScreen();
  
  shop = false;
  
  state = 1;

  turn = 0;
  // starts the constructor for the objects
  objectLoader();
  
  theGoldBar = loadImage("gold.png");
  back = loadImage("Plains.jpg");
  
  theWeaponLevel = 0.1;
  
  armour = 3;
  speed = 3;
  attack = 3;


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
    shop = false;// allow for movement
     
    lvl1.levelLoaderDrawLoop();// main code for board 
     
    fill(0);
    drawResourceBar();// draws all the elements at the bottom and the button to enter the shop
  } 
  
  else if (state == 2) { // stick man fight
    image(back,width/2,height/2,width,height);
    handleStickerman();// all the code for the stick square battle
    
    weaponHandler();
  }
  else if(state == 3){
    shop = true;
    
    attack = theShop.weaponLevel + 3;// add three to compensate for the starter value 
    armour = theShop.armourLevel + 3;
    speed = theShop.speedLevel + 3;
    
    theShop.getGoldValue(lvl1.amountOfGold);// get the current of gold
    theShop.myShopDrawLoop();
      
    lvl1.amountOfGold = theShop.returnUpdatedGoldValue();// returning the amount of gold after transaction
      
    backToGameButton();
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

void backToGameButton(){
  backButton.displayButton(width - width/3,height/4,200,100);
  backButton.isTheButtonBeingClicked(1);
  backButton.theText("Back");
  
  

}


void  helpScreen() {
  text("dont know yet to play the game", width/2, height/2);
}


/////////////////////////////////////////////////////////////////////////// code involing the stickman
void handleStickerman() { // sets up the stickman and starts the moving;
  //human plauer
  humanPlayerStickMan.display();
  humanPlayerStickMan.movement(speed);
  
  //ai player
  lvl1.aiBattleHandler();
  
  float whichOneToAttack = lvl1.whichAiIsDoingBattle;
    if(whichOneToAttack == 1){
      weapon1.attack(lvl1.orangeAi.thisAiStickman,attack);
        
  }
    if(whichOneToAttack == 2){
      weapon1.attack(lvl1.redAi.thisAiStickman,attack);
  
  }
    if(whichOneToAttack == 3){
      weapon1.attack(lvl1.blackAi.thisAiStickman,attack);
  
  }
    if(whichOneToAttack == 4){
      weapon1.attack(lvl1.mongolAi.thisAiStickman,attack);
  
  }
  
}

void weaponHandler() {
  weapon1.display(humanPlayerStickMan.x);
  weapon1.move(humanPlayerStickMan.x,humanPlayerStickMan.y);
  //weapon1.attack(aiControledStickMan,attack);
  
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
  weapon1.ammo1.isShooting = true;
  if(shop == false){
    lvl1.mouseHandler(); // triggers the char to move. ALL THE MAJOR CODE FOR CHAR
    
  }

}



//////////////////////////////////////  background functions such as loading objects
void objectLoader() {

  // stickman/fighters
  humanPlayerStickMan = new Stickman();

 
  //buttons
  startButton = new Button();
  helpButton = new Button();
  shopButton = new Button();
  backButton = new Button();
  
  // weapons ammo,...
  w1 = new Weapon();
  weapon1 = new WeaponType(0, 1 , 15 , "gun.jpg", 2,0.1,humanPlayerStickMan.x + humanPlayerStickMan.x/12  , humanPlayerStickMan.y,humanPlayerStickMan.w*2,humanPlayerStickMan.h);
  
  //game sections
  theShop = new Shop();
  lvl1 = new LevelLoader("0.txt"); //load whichever level you want hint make your own if you want
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
  
  float shopButtonX = 0;
  float shopButtonY = height - lvl1.tileHeight/2;
  float shopButtonW = lvl1.tileWidth*5;
  float shopButtonH = lvl1.tileHeight;


  // this is the code for the items at the buttom of the screen
  rectMode(CORNER);
  fill(0);

  rect(0,barY,barWidth,barHeight);// drawing the black bar at the bottom


  image(theGoldBar,goldBarX,barY,goldBarW,goldBarH);// drawing the gold sprite
  
  fill(255);// want white for the text with size 24
  textSize(24);
  
  ////// all the text you find on the resource bar
  // just the = sign
  text("= ",goldBarX + 40,barY+goldBarH/2+5);
  
  // amount of gold you have as of this turn 
  text(int(lvl1.amountOfGold),goldBarX + 80,barY+goldBarH/2+5); 
  
  // just the word turn
  text("turn",goldBarX/2 - width/16,barY+goldBarH/2+5); 
  
  // how many turns have passed
  text(lvl1.turnCounter,goldBarX/2 - width/16 + 80,barY+goldBarH/2+5);
  
  //enter shop button code
  shopButton.displayButton(shopButtonX,shopButtonY,shopButtonW,shopButtonH);
  shopButton.isTheButtonBeingClicked(3);
  
  fill(255);
  textSize(16);
  text("SHOP",shopButtonX + shopButtonW/22,shopButtonY + shopButtonH/12);
 

}