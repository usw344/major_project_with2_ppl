

class LevelLoader {
  // all int vars
  int boardHeight, boardWidth; 
  int charX, charY;

  int xCord, yCord;
  int turnCounter;
  int clickedXCord, clickedYCord;


  // float vars
  float tileHeight, tileWidth;
  
  //loading the stickman
  PImage stickMan;

 
  //the board array
  Tile[][] allTiles;
  

  //???
  boolean isTurnOver;
  



  LevelLoader(String levelWeAreOn) {
    String lines[] = loadStrings(levelWeAreOn);
    boardHeight = lines.length;
    boardWidth = lines[0].length();
    stickMan = loadImage("Sticky.png");
    isTurnOver = false;
    turnCounter = 0;


    tileWidth = width/float(boardWidth);
    tileHeight = height/float(boardHeight);


    allTiles = new Tile[boardWidth][boardHeight];


    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        char tileType = lines[y].charAt(x);
        allTiles[x][y] = new Tile(x*tileWidth, y*tileHeight, tileWidth, tileHeight, tileType);
        //println(x,y);
      }
    }
    charX = 5 * int(tileWidth);
    charY = 22 * int(tileHeight);
  }

  void showBoard() {
    for (int y = 0; y < boardHeight; y++) {
      for (int x = 0; x < boardWidth; x++) {
        //moveCharch():
        allTiles[x][y].display();
      }
    }
  }

  void moveCharch() {
    xCord = int(mouseX/tileWidth);
    yCord = int(mouseY/tileHeight);

  }



  boolean  legalMoveChecker(int x, int y) {

    if (x >= 0 && x<=24 && y <= 23) {
      // this part checks for enemy base and then starts battle
      if (checkForlegalMoveOnTownHall(x, y) && allTiles[x][y].checker('B')) {
        battle();
        return true;
      }
      /// this next if block checks for empty space to  move to
      if (allTiles[x-1][y].checker('O')) {
        //println("true");
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
    } else {
      text("invalid move", width/2, height/2);
      return false;// not a valid move.
    }
    text("invalid move", width/2, height/2);
    return false;
  }


  void mouseHandler() {
    clickedXCord = int(mouseX/tileWidth);
    clickedYCord = int(mouseY/tileHeight);

    if (legalMoveChecker(clickedXCord, clickedYCord)) {
      charX = clickedXCord * int(tileWidth);
      charY = clickedYCord * int(tileHeight);
      allTiles[xCord][yCord].switchTileTo('O');
      turnCounter ++;
    }
  }

  void displayChar() {
    image(stickMan, charX, charY, tileWidth, tileHeight);
  }
  void battle() {
    state = 2;
  }


  boolean checkForlegalMoveOnTownHall(int x, int y) {
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
}