class LevelLoader {
  // all int vars
  int boardHeight, boardWidth; 

  //var used to see where you are clicking
  int charX, charY;
  int xCord, yCord;
  int clickedXCord, clickedYCord;
  
  int whichAiIsDoingBattle;

  // to do with turn and resources
  float amountOfGold, amountToAdd;
  int turnCounter, amountOfMovesLeft;

  // float vars for tiles
  float tileHeight, tileWidth;

  //loading the stickman
  PImage stickMan, hill;

  //turn boolean
  boolean myTurn;

  boolean timeForTheMongols;
  BoardAi orangeAi, redAi, blackAi, mongolAi;
  
  //timer for water Animation;
  Timer clockForWaterAnimation;


  //the board array
  Tile[][] allTiles, loadMongolsTiles;

  // vars for ai
  int aiX, aiY;
  String mongolMap[];




  LevelLoader(String levelWeAreOn) {
    String lines[] = loadStrings(levelWeAreOn);
    
    // mongols are loaded from their own file
    mongolMap = loadStrings("mongols.txt");
    
    // determin which ai is doing battle
    whichAiIsDoingBattle = 0;
    
    myTurn = false;
    
    timeForTheMongols = false;
  
    boardHeight = lines.length;
    boardWidth = lines[0].length();
    
    stickMan = loadImage("Sticky.png");


    turnCounter = 0;

    //scalling the tiles to each screen
    tileWidth = width/float(boardWidth);
    tileHeight = height/float(boardHeight);

    //starting the array for the board
    allTiles = new Tile[boardWidth][boardHeight];

    //getting timer started
    clockForWaterAnimation = new Timer(500);
    clockForWaterAnimation.begin();

    amountOfMovesLeft = 3;

    //setting up default board
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        char tileType = lines[y].charAt(x);

        allTiles[x][y] = new Tile(x*tileWidth, y*tileHeight, tileWidth, tileHeight, tileType);
      
    }

    
    //doesnt do much for now
    charX = 5 * int(tileWidth);
    charY = 22 * int(tileHeight);

    
    
    // need to load hill here as to not overburden the ram
    hill = loadImage("hill.png");


    // how to read the following lines
    //float _stickmanXLocation, float _speedOfStickman, float attackValueOfAI, String imageOfAiSticman, String revers image,
    
    orangeAi = new BoardAi(boardHeight, boardWidth, 17, 14 , 'A',width-width/4,3,10,"Red.png","RedR.png",true,3);
    redAi = new BoardAi(boardHeight, boardWidth, 20, 2 , 'B',width-width/4,5,10,"Yellow.png","YellowR.png",true,3);
    blackAi = new BoardAi(boardHeight, boardWidth, 5, 4 , 'C',width-width/4,5,10,"Black.png","BlackR.png",true,5);
    
  }
  }


   // main code for the level loader
  void levelLoaderDrawLoop(){
    waterAnimation();// makes the water gliter
    
    showBoard();
    
    unleasheTheMongols();// handle all mongol code
  
    if(myTurn == false){
      for(int i = 0; i < 3; i++){// gives the ai 3 moves
        
        //moves all the ai
        blackAi.boardAiDrawLoop(allTiles);
        orangeAi.boardAiDrawLoop(allTiles);
        redAi.boardAiDrawLoop(allTiles);
       
        if(timeForTheMongols){// checks to see if right amount of turn have passed
          mongolAi.boardAiDrawLoop(allTiles);
          
          if(mongolAi.amIDead()){// the way to deafeat the mongols
            changeIt('M');
          }
    }
      }
    
    amountOfMovesLeft = 3;
    
    myTurn = true;
    
  }
  }

  void changeIt(char changeThisChar){// changes the lost ai tile to yours to your tile
    for (int x = 0; x < boardHeight; x++) {
      for (int y = 0; y < boardWidth; y++) {
    
        if(allTiles[x][y].checker(changeThisChar)){
          
          allTiles[x][y].switchTileTo('O');       
        
    }
  
  }
    }
  }
  

  void aiBattleHandler(){// does all the ai battle
    // this next block determines which ai (orange, yellow etc) did you try to attach. Then its tells the board ai class to tell the stickman to fight
    
    if(whichAiIsDoingBattle == 1){
      // makes both do batttle
      orangeAi.aiStickManBattle(humanPlayerStickMan);
      
      
      humanPlayerStickMan.theEnd(humanPlayerStickMan);// the end functions checks to see if you are dead
      
      if(orangeAi.amIDead()){
          changeIt('A');
      }
  }
    if(whichAiIsDoingBattle == 2){
      redAi.aiStickManBattle(humanPlayerStickMan);
      
      
      humanPlayerStickMan.theEnd(humanPlayerStickMan);
      
      if(redAi.amIDead()){/// checks to see if you won
          changeIt('B');
      }
  }
    if(whichAiIsDoingBattle == 3){
      blackAi.aiStickManBattle(humanPlayerStickMan);
      
      
      humanPlayerStickMan.theEnd(humanPlayerStickMan);
      
      if(blackAi.amIDead()){
          changeIt('C');
      }
  }
    if(whichAiIsDoingBattle == 4){
      mongolAi.aiStickManBattle(humanPlayerStickMan);
      
      
      humanPlayerStickMan.theEnd(humanPlayerStickMan);
      if(mongolAi.amIDead()){
          changeIt('M');
      }
  }
  
  }

  void showBoard() {
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        
        allTiles[x][y].display();
        
        if(allTiles[x][y].checker('H')){// need to display hill here because it crashes in the tile object (because we have an array and it loads the image to much)
          fill(255);
          rectMode(CORNER);
          imageMode(CORNER);
          
          image(hill,x*tileWidth, y*tileHeight, tileWidth, tileHeight);      
        }
      }
    }
  }
  void waterAnimation() {
    if (clockForWaterAnimation.isFinished()) {// when around 0.5 sec has passed randomize the color of the water
      for (int y = 0; y < boardHeight; y++) {
        for (int x = 0; x < boardWidth; x++) {
          allTiles[x][y].animateWater();// run the animate code (randomly select a color in the blue scale)
        }
      }
      //start clock 
      clockForWaterAnimation.begin();// reset the clock
    }
  }



   boolean  legalMoveChecker(char baseChar, int x, int y) {// this functions deals with seeing if the clicked square needs a battle to start
    if (x >= 0 && x<=24 && y <= 23) {// prevents array out of bound error
      if (checkerCode('O', x, y)) {
      // this part checks for enemy base and then starts battle
        /// goes through all the ai letters
        if (allTiles[x][y].checker(baseChar)) {
          if(allTiles[x][y].checker('A')){// orange
            whichAiIsDoingBattle = 1;
          }
          
          if(allTiles[x][y].checker('B')){// red
            whichAiIsDoingBattle = 2;  
        }
          
          if(allTiles[x][y].checker('C')){// black
            whichAiIsDoingBattle = 3;
          }
          
          
          if(allTiles[x][y].checker('M')){
            whichAiIsDoingBattle = 4;
          }
          battle();// at the end do battle
          return true;
        }
      }

      /// runs though whtie space
      return checkerCode('O', x, y);
    } 
    return false; // not a valid move dont move
  }


  void unleasheTheMongols(){
    if(timeForTheMongols == false && turnCounter > 25){
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        char tileType = mongolMap[y].charAt(x);
        if(tileType == 'M'){
          allTiles[x][y].switchTileTo('M');
        }
        if(tileType == 'm'){
          mongolAi = new BoardAi(boardWidth,boardHeight,x,y,'M',width-width/4,30,10,"mongls.png","MongolsR.png",true,10);
        }
    }
    }

      timeForTheMongols  = true;
    }
    
  }

  void mouseHandler() {
    //calculating which tile the mouse is on the screen    
    clickedXCord = int(mouseX/tileWidth);
    clickedYCord = int(mouseY/tileHeight);
    if(allTiles[clickedXCord][clickedYCord].checkForObstcle('H') == 1 || allTiles[clickedXCord][clickedYCord].checkForObstcle('w') == 2){
      println("invalid moves");
    }
    else if(amountOfMovesLeft == 0){
      myTurn = false;
    }

    else {// if this happens then it means you clicked on somthing that is clickable
      legalMoveChecker('B', clickedXCord, clickedYCord);
      legalMoveChecker('A', clickedXCord, clickedYCord);
      legalMoveChecker('C', clickedXCord, clickedYCord);
      legalMoveChecker('M', clickedXCord, clickedYCord);
      
      if (legalMoveChecker('B', clickedXCord, clickedYCord) || legalMoveChecker('A', clickedXCord, clickedYCord) ||  legalMoveChecker('M', clickedXCord, clickedYCord) || legalMoveChecker('C', clickedXCord, clickedYCord) ) {
        //changing where the stickman is to be drawn later on
        charX = clickedXCord * int(tileWidth);
        charY = clickedYCord * int(tileHeight);
  
        // switching the tile which was clicked upon into a upperCase o which is green tile
        allTiles[clickedXCord][clickedYCord].switchTileTo('O');
  
        //upadte both turn and gold count
        turnCounter ++ ;
  
        calculateGold();
        turn = 1;
        amountOfMovesLeft -= 1;
    }
  }
  }
  void battle() {
    state = 2;
  }


  void calculateGold() {
    //this function goes through and checks for all your tiles and gives you one gold per tile
    amountToAdd = 0;
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        if (allTiles[x][y].checker('O')) {
          amountToAdd ++;
        }
      }
    }
    amountOfGold += amountToAdd;
  }

 
  // generic code for checking multiple char
  boolean checkerCode(char checkThis, int __x, int __y) {
    if (__x > 0 && __x<24 && __y < 23 && __y > 0) {   
      if (allTiles[__x+1][__y].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x][__y+1].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x][__y-1].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x-1][__y].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x-1][__y+1].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x-1][__y+1].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x+1][__y+1].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x+1][__y-1].checker(checkThis)) {
        return true;
      }

      if (allTiles[__x-1][__y-1].checker(checkThis)) {
        return true;
      }
      return false;
    }  
    return false;
  }
  
}