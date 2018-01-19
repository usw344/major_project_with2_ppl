// Muhammad and kam major project
// due date Jan 18 2017
// for comp sci 30(fall)
// a game based on civ, MTW2 and the wild and crazy ideas of Kam  && Muhammad


///// patch 0.0.1 release notes
// after the hyped relase on jan 15 Linux airs presents the fist patch

// this includes
// a way to win and lose the game
// better and smoother graphics
// a better optimised game.
// many small bug fixes

/// thank you for your patience
//// Kamden Wall && Muhammad Ahmed. Comp sci 30 (fall) 2018.
// thanks for the great 2 years.


//loading our objects
Stickman humanPlayerStickMan,aiControledStickMan;
LevelLoader lvl1;
Button startButton, helpButton, shopButton, backButton,levelButton;
WeaponType weapon1;
Ammo arrow;
Shop theShop; //firstShop;

int turn;

float theWeaponLevel;

String lvl0, lvl2, lvl3;

// images for the resource bar at the bottom and hut
PImage ourHut,theGoldBar,back;

//the state
int state;

// for the stickman armour, attack and speed
float armour,attack,speed;

boolean shop;
void setup() {
  //switch between full screen and normal WARNING DO NOT USE FULLSCREEN FOR DEBUGGING
  
  size(800,800);
  //size(1360, 693);
  //fullScreen();
  
  shop = false;
  
  state = 0;

  turn = 0;
  
  // starts the constructor for the objects
  objectLoader();
  
  theGoldBar = loadImage("gold.png");
  back = loadImage("Plains.jpg");
  
  theWeaponLevel = 0.1;
  
  armour = 3;
  speed = 3;
  attack = 3;

  lvl0 = "o.txt";
  lvl2 = "lvl1.txt";
  lvl3 = "lvl2.txt";

}


void draw() {
  background(255);


  if (state == 0) { // intro screne
    shop = true;
    startScreen(); // all the buttons for the first screen
    //helpButtonCode(); // instructions for the game
    //selectLevelButton(); // select your level
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
    
    weapon1.updateTheAmmo(humanPlayerStickMan.y);
    weaponHandler();
    
    if(humanPlayerStickMan.youLost) {
      state = 4;// if all your lives are gone then the game ends
    }
  }
  else if(state == 3){
    shop = true;
    
    // add three to compensate for the starter value (which are 0)
    attack = theShop.weaponLevel + 3;
    armour = theShop.armourLevel + 3;
    speed = theShop.speedLevel + 3;
    
    theShop.getGoldValue(lvl1.amountOfGold);// get the current of gold
    
    // main run code for the shop. Neatly orginized into a single function
    theShop.myShopDrawLoop();
      
    lvl1.amountOfGold = theShop.returnUpdatedGoldValue();// returning the amount of gold after transaction
      
    backToGameButton();
  }
  else if(state == 4) {
    background(0);
    fill(255);
    textSize(14);
    text("You failed your mission, your emporor died in battle. Who thought it was a good idea to send him into battle?",0,height/2);
  }
  else if(state == 5){// not done yet
    //levelSelectorCode();
  
  }

}


///////////////////////////////////////////////// all code for the buttons
void startScreen() {
  background(255);
  startButton.displayButton(width/2, height/4, width/3, height/5);
  startButton.isTheButtonBeingClicked(1);// go to the game when clicked
  startButton.theText("Start");
}

void selectLevelButton(){
  levelButton.displayButton(width/2, height/2,width/3,height/5);
  levelButton.isTheButtonBeingClicked(5);
  levelButton.theText("Levels");


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

///////////////////////// do nothing as of this patch
void  helpScreen() {
  text("dont know yet to play the game", width/2, height/2);
}


void levelSelectorCode(){
  //

}

/////////////////////////////////////////////////////////////////////////// code involing the stickman
void handleStickerman() { // sets up the stickman and starts the moving;
  //human player main code
  
  humanPlayerStickMan.display();
  humanPlayerStickMan.movement(speed);
  humanPlayerStickMan.healthBar();
  
  //ai player
  lvl1.aiBattleHandler();
  
  // this handels which ai the human is attacking
  float whichOneToAttack = lvl1.whichAiIsDoingBattle;
    if(whichOneToAttack == 1){
      weapon1.attack(lvl1.orangeAi.thisAiStickman,attack,humanPlayerStickMan.y);
        
  }
    if(whichOneToAttack == 2){
      weapon1.attack(lvl1.redAi.thisAiStickman,attack,humanPlayerStickMan.y);
  
  }
    if(whichOneToAttack == 3){
      weapon1.attack(lvl1.blackAi.thisAiStickman,attack,humanPlayerStickMan.y);
  
  }
    if(whichOneToAttack == 4){
      weapon1.attack(lvl1.mongolAi.thisAiStickman,attack,humanPlayerStickMan.y);
  
  }
  
}

// name says it all. This handels the human player weapon
void weaponHandler() {
  weapon1.display(humanPlayerStickMan.x);
  weapon1.move(humanPlayerStickMan.x,humanPlayerStickMan.y);
  //weapon1.attack(aiControledStickMan,attack);
  
}

/// this makes the stickman move;
void keyPressed() {
  humanPlayerStickMan.handleKeyPress();
  
}
void keyReleased() {
  humanPlayerStickMan.handleKeyRelease();
}

/// handles the the board human movement and basically 60% of its functions
void mousePressed() {
  // this is for the battle, needed it in a mousPressed()
  weapon1.ammo1.isShooting = true;
  
  //else on all other occasion we want to be moving around on the board
  if(shop == false){
    lvl1.mouseHandler(); // triggers the char to move. ALL THE MAJOR CODE FOR CHAR
    
  }

}



//////////////////////////////////////  background functions such as loading objects
void objectLoader() {

  /// simple function to load all the objects rather than have them sit in the setup
  
  
  // stickman/fighters
  humanPlayerStickMan = new Stickman();

 
  //buttons
  startButton = new Button();
  helpButton = new Button();
  shopButton = new Button();
  backButton = new Button();
  levelButton = new Button();
  
  // weapons ammo,...
 
  weapon1 = new WeaponType(0, 1 , 15 , "Crossbow.png", 2,0.1,humanPlayerStickMan.x + humanPlayerStickMan.x/15  , humanPlayerStickMan.y + 10 ,humanPlayerStickMan.w*3,humanPlayerStickMan.h*2,"CrossbowL.png");
  
  //game sections
  theShop = new Shop();
  
  lvl1 = new LevelLoader("0.txt"); //load whichever level you want hint make your own if you want
}


void drawResourceBar() {
  ///// very inefficent but, gets the job done. Draws that bar at the bottom of the screen
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
 
 //draws the amount of lives you have
  text("Lives:",shopButtonX+shopButtonW/2,shopButtonY+shopButtonH/12);
  text(humanPlayerStickMan.lives,shopButtonX+shopButtonW/1.1,shopButtonY+shopButtonH/12);
}