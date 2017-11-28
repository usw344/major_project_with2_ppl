
class LevelLoader {
  int tileHeight, tileWidth; 
  float indivudalTileHeight, indivudalTileWidth;
  int charX, charY;
  //this is the x and y of the character

  Tile[][] allTiles;
  int xCord, yCord;
  

  LevelLoader(String levelWeAreOn) {
    String lines[] = loadStrings(levelWeAreOn);
    tileHeight = lines.length;
    tileWidth = lines[0].length();


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
    charX = 11 * int(indivudalTileWidth);
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

    PImage stiuc;
    stiuc = loadImage("Sticky.png");
    image(stiuc,charX,charY, indivudalTileWidth,indivudalTileHeight);

    legalMoveChecker(xCord,yCord);
    if(mousePressed ) {//&& legalMoveChecker(xCord,yCord)) {
      charX = mouseX- int(indivudalTileWidth/2);
      charY = mouseY - int(indivudalTileHeight/2);
      
      allTiles[xCord][yCord].switchTileTo('O');
      
      stiuc = loadImage("Sticky.png");
      image(stiuc,charX,charY, indivudalTileWidth,indivudalTileHeight);
    }
  }



  void  legalMoveChecker(int x, int y) {
    if(allTiles[x][y+1].checker('o')){
      println("true");
    }
  
  }

}