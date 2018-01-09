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
    mongolMap = loadStrings("mongols.txt");
    
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

    //float _stickmanXLocation, float _speedOfStickman, float attackValueOfAI, String imageOfAiSticman
    orangeAi = new BoardAi(boardHeight, boardWidth, 17, 14 , 'A',width-width/4,3,10,"knight.png");
    redAi = new BoardAi(boardHeight, boardWidth, 20, 2 , 'B',width-width/4,5,10,"Sticky.png");
    blackAi = new BoardAi(boardHeight, boardWidth, 5, 4 , 'C',width-width/4,5,10,"Sticky.png");
    
  }
  }

  void levelLoaderDrawLoop(){
    waterAnimation();// makes the water gliter
    showBoard();
    unleasheTheMongols();
  
    if(myTurn == false){
      for(int i = 0; i < 6; i++){
        blackAi.boardAiDrawLoop(allTiles);
        orangeAi.boardAiDrawLoop(allTiles);
        redAi.boardAiDrawLoop(allTiles);
        if(timeForTheMongols){
          mongolAi.boardAiDrawLoop(allTiles);
    }
      }
    
    amountOfMovesLeft = 3;
    myTurn = true;
  }
  }


  void aiBattleHandler(){
    if(whichAiIsDoingBattle == 1){
      orangeAi.aiStickManBattle(humanPlayerStickMan);
  }
    if(whichAiIsDoingBattle == 2){
      redAi.aiStickManBattle(humanPlayerStickMan);
  
  }
    if(whichAiIsDoingBattle == 3){
      blackAi.aiStickManBattle(humanPlayerStickMan);
  
  }
    if(whichAiIsDoingBattle == 4){
      mongolAi.aiStickManBattle(humanPlayerStickMan);
  
  }
  
  }

  void showBoard() {
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        allTiles[x][y].display();
        if(allTiles[x][y].checker('H')){// need to display hill here because it crashes in the tile object
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
          allTiles[x][y].animateWater();
        }
      }
      //start clock 
      clockForWaterAnimation.begin();
    }
  }



  boolean  legalMoveChecker(char baseChar, int x, int y) {// this functions deals with seeing if the clicked square needs a battle to start
    if (x >= 0 && x<=24 && y <= 23) {// prevents array out of bound error
      // this part checks for enemy base and then starts battle
      if (allTiles[x][y].checker(baseChar)) {
        if(allTiles[x][y].checker('A')){// orange
          whichAiIsDoingBattle = 1;
        }
        if(allTiles[x][y].checker('B')){// red
          whichAiIsDoingBattle = 2;
        }
        if(allTiles[x][y].checker('C')){// blac
          whichAiIsDoingBattle = 3;
        }
        if(allTiles[x][y].checker('M')){
          whichAiIsDoingBattle = 4;
        }
        battle();
        return true;
      }

      /// this next if block checks for empty space to  move to
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
          mongolAi = new BoardAi(boardWidth,boardHeight,x,y,'M',width-width/4,5,10,"Sticky.png");
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
    if (__x > 0 && __x<24 && __y < 23) {   
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