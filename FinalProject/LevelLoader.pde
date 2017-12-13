

class LevelLoader {
  // all int vars
  int boardHeight, boardWidth; 
  
  //var used to see where you are clicking
  int charX, charY;
  int xCord, yCord;
  int clickedXCord, clickedYCord;
  
  // to do with turn and resources
  int amountOfGold, amountToAdd;
  int turnCounter;

  // float vars
  float tileHeight, tileWidth;
  
  //loading the stickman
  PImage stickMan;

 
  //the board array
  Tile[][] allTiles;
  
  // vars for ai
  int aiX, aiY;
  
  //booleans for ai movement
  boolean moveToRight;
  boolean moveToLeft;
  boolean moveToUp;
  boolean moveToDown;
  
  



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
        if(allTiles[x][y].checker('A')) {
          aiX = x;
          aiY = y;
          
        }  
      }
  }
  moveToRight = false;
  moveToLeft = false;
  moveToUp = false;
  moveToDown = false;

}


  void showBoard() {
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        //moveCharch():
        allTiles[x][y].display();
      }
    }
  }





  boolean  legalMoveChecker(int x, int y) {
    if (x >= 0 && x<=24 && y <= 23) {// prevents array out of bound error
      // this part checks for enemy base and then starts battle
      if (checkForlegalMoveOnTownHall(x, y) && allTiles[x][y].checker('B')) {
        battle();
        
        return true;
      }
      
      /// this next if block checks for empty space to  move to
      if (allTiles[x-1][y].checker('O')) {
        return true;
      }
      
      if (allTiles[x][y+1].checker('O')) {
        return true;
      }
      
      if (allTiles[x][y-1].checker('O')) {
        return true;
      }
      
      if (allTiles[x+1][y].checker('O')) {
        return true;
      }
      
      if (allTiles[x-1][y+1].checker('O')) {
        return true;
      }
      
      if (allTiles[x-1][y+1].checker('O')) {
        return true;
      }
      
      if (allTiles[x+1][y+1].checker('O')) {
        return true;
      }
      
      if (allTiles[x+1][y-1].checker('O')) {
        return true;
      }
      
      if (allTiles[x-1][y-1].checker('O')) {
        return true;
      }
    } 
    return false; // not a valid move dont move
  }


  void mouseHandler() {
    //calculating which tile the mouse is on the screen    
    clickedXCord = int(mouseX/tileWidth);
    clickedYCord = int(mouseY/tileHeight);

    if (legalMoveChecker(clickedXCord, clickedYCord)) {
      //changing where the stickman is to be drawn later on
      charX = clickedXCord * int(tileWidth);
      charY = clickedYCord * int(tileHeight);
      
      // switching the tile which was clicked upon into a upperCase o which is green tile
      allTiles[clickedXCord][clickedYCord].switchTileTo('O');
      
      //upadte both turn and gold count
      turnCounter ++;
      
      calculateGold();
    }
  }

  void displayChar() {
    image(stickMan, charX, charY, tileWidth, tileHeight);
  }
  void battle() {
    state = 2;
  }


  boolean checkForlegalMoveOnTownHall(int x, int y) {
    //checking all around to see if we can have a battle
    if (allTiles[x+1][y].checker('O')) {
      return true;
    }
    
    if (allTiles[x][y+1].checker('O')) {
      return true;
    }
    
    if (allTiles[x][y-1].checker('O')) {
      return true;
    }
    
    if (allTiles[x-1][y].checker('O')) {
      return true;
    }
    
    if (allTiles[x-1][y+1].checker('O')) {
      return true;
    }
    
    if (allTiles[x-1][y+1].checker('O')) {
      return true;
    }
    
    if (allTiles[x+1][y+1].checker('O')) {
      return true;
    }
    
    if (allTiles[x+1][y-1].checker('O')) {
      return true;
    }
    
    if (allTiles[x-1][y-1].checker('O')) {
      return true;
    }
    return false;
  }

  void calculateGold() {
    //this function goes through and checks for all your tiles and gives you one gold per tile
    
    amountToAdd = 0;
    
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        if(allTiles[x][y].checker('O')) {
          amountToAdd ++;
        }  
      }
  }
    amountOfGold += amountToAdd;  

}

  void aiHandler() {
    
    int whichWayToMove;
    whichWayToMove =  int(random(0,4));
    
    
    
    if(moveToRight) {
    // add checker code for right
    
    }
    else if(moveToLeft) {
    // add checker code for left
    
    }
    else if(moveToUp) {
    // add checker code for up
    
    }
    else if(moveToDown){
    // add checker code for down
    
    }
    
    
  }
  






}