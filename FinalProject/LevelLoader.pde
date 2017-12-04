

class LevelLoader {
  int tileHeight, tileWidth; 
  float indivudalTileHeight, indivudalTileWidth;
  int charX, charY;
  //this is the x and y of the character
  PImage stiuc;

  int charXActualLocal, charYActualLocal;

  Tile[][] allTiles;
  int xCord, yCord;

  int turnCounter;
  boolean isTurnOver;
  int clickedXCord, clickedYCord;



  LevelLoader(String levelWeAreOn) {
    String lines[] = loadStrings(levelWeAreOn);
    tileHeight = lines.length;
    tileWidth = lines[0].length();
    stiuc = loadImage("Sticky.png");
    isTurnOver = false;
    turnCounter = 0;


    indivudalTileWidth = width/float(tileWidth);
    indivudalTileHeight = height/float(tileHeight);

    //println(indivudalTileWidth, indivudalTileHeight);

    allTiles = new Tile[tileWidth][tileHeight];


    for (int y = 0; y < tileHeight; y++) {
      for (int x = 0; x < tileWidth; x++) {
        char tileType = lines[y].charAt(x);
        allTiles[x][y] = new Tile(x*indivudalTileWidth, y*indivudalTileHeight, indivudalTileWidth, indivudalTileHeight, tileType);
        //println(x,y);
      }
    }
    charX = 5 * int(indivudalTileWidth);
    charY = 22 * int(indivudalTileHeight);
  }

  void showBoard() {
    for (int y = 0; y < tileHeight; y++) {
      for (int x = 0; x < tileWidth; x++) {
        //moveCharch():
        allTiles[x][y].display();
      }
    }
  }

  void moveCharch() {
    xCord = int(mouseX/indivudalTileWidth);
    yCord = int(mouseY/indivudalTileHeight);
  }



  boolean  legalMoveChecker(int x, int y) {

    if (x >= 0 && x<=24 && y <= 23) {
      // this part checks for enemy base and then starts battle
      if (checkForlegalMoveOnTownHall(x,y) && allTiles[x][y].checker('B')) {
        battle();
        return true;
      }
      /// this next if block checks for empty space to  move to
      if(allTiles[x+1][y].checker('O')) {
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
    clickedXCord = int(mouseX/indivudalTileWidth);
    clickedYCord = int(mouseY/indivudalTileHeight);

    if (legalMoveChecker(clickedXCord, clickedYCord)) {
      charX = clickedXCord * int(indivudalTileWidth);
      charY = clickedYCord * int(indivudalTileHeight);
      allTiles[xCord][yCord].switchTileTo('O');
      turnCounter ++;
    }
  }

  void displayChar() {
    image(stiuc, charX, charY, indivudalTileWidth, indivudalTileHeight);
  }
  void battle() {
    state = 2;
  }


  boolean checkForlegalMoveOnTownHall(int x, int y) {
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
    return false;

}

}