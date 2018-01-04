

class LevelLoader {
  // all int vars
  int boardHeight, boardWidth; 

  //var used to see where you are clicking
  int charX, charY;
  int xCord, yCord;
  int clickedXCord, clickedYCord;

  // to do with turn and resources
  float amountOfGold, amountToAdd;
  int turnCounter;

  // float vars
  float tileHeight, tileWidth;

  //loading the stickman
  PImage stickMan;

  //timer for water Animation;
  Timer clockForWaterAnimation;


  //the board array
  Tile[][] allTiles;

  // vars for ai
  int aiX, aiY;





  LevelLoader(String levelWeAreOn) {
    String lines[] = loadStrings(levelWeAreOn);

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
    clockForWaterAnimation = new Timer(1500);

    //setting up default board
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        char tileType = lines[y].charAt(x);

        allTiles[x][y] = new Tile(x*tileWidth, y*tileHeight, tileWidth, tileHeight, tileType);
      }
    }
    //doesnt do much for now
    charX = 5 * int(tileWidth);
    charY = 22 * int(tileHeight);

    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        if (allTiles[x][y].checker('A')) {
          aiX = x;
          aiY = y;
        }
      }
    }
  }


  void showBoard() {
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        allTiles[x][y].display();
      }
    }
  }
  void waterAnimation() {
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        allTiles[x][y].animateWater();
      }
    }
  }  



  boolean  legalMoveChecker(char baseChar, int x, int y) {
    if (x >= 0 && x<=24 && y <= 23) {// prevents array out of bound error
      // this part checks for enemy base and then starts battle
      if (allTiles[x][y].checker(baseChar)) {
        battle();

        return true;
      }

      /// this next if block checks for empty space to  move to
      return checkerCode('O', x, y);
    } 
    return false; // not a valid move dont move
  }


  void mouseHandler() {
    //calculating which tile the mouse is on the screen    
    clickedXCord = int(mouseX/tileWidth);
    clickedYCord = int(mouseY/tileHeight);

    println(legalMoveChecker('B', clickedXCord, clickedYCord));
    println(legalMoveChecker('A', clickedXCord, clickedYCord));

    if (legalMoveChecker('B', clickedXCord, clickedYCord) || legalMoveChecker('A', clickedXCord, clickedYCord) ) {
      //changing where the stickman is to be drawn later on
      charX = clickedXCord * int(tileWidth);
      charY = clickedYCord * int(tileHeight);

      // switching the tile which was clicked upon into a upperCase o which is green tile
      allTiles[clickedXCord][clickedYCord].switchTileTo('O');

      //upadte both turn and gold count
      turnCounter ++;

      calculateGold();
      turn = 1;
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

  void aiHandler() {

    int whichWayToMove;
    whichWayToMove =  int(random(1, 5));

    if (whichWayToMove == 1 && aiY + 1 <= 24 ) {  //checkerCode('A',aiX,aiY + 1)) {// move down
      allTiles[aiX][aiY + 1].switchTileTo('A');
      aiY = aiY +1;
    } else if (whichWayToMove == 2 && aiY -1 >= 0) {// checkerCode('A',aiX,aiY -1)) {// move up
      allTiles[aiX][aiY -1].switchTileTo('A');
      aiY = aiY -1;
    } else if (whichWayToMove == 3 &&  aiX + 1 <= 24) {//checkerCode('A',aiX + 1,aiY)) {// move right
      allTiles[aiX +1][aiY].switchTileTo('A');
      aiX = aiX +1;
    } else if (whichWayToMove == 4 && aiX -1 >= 0 ) {//checkerCode('A',aiX -1 ,aiY)) {// move left
      allTiles[aiX -1 ][aiY].switchTileTo('A');
      aiX = aiX -1;
    }
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