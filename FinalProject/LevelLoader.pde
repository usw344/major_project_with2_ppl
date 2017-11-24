
class LevelLoader {
  int tileHeight, tileWidth; 
  float indivudalTileHeight, indivudalTileWidth;
  //this is the x and y of the character
  int Cx,Cy;
  Tile[][] allTiles;

  LevelLoader(String levelWeAreOn) {
    String lines[] = loadStrings(levelWeAreOn);
    tileHeight = lines.length;
    tileWidth = lines[0].length();

    indivudalTileWidth = width/tileWidth;
    indivudalTileHeight = height/tileHeight;

    allTiles = new Tile[tileWidth][tileHeight];


    for (int y = 0; y < tileHeight; y++) {
      for (int x = 0; x < tileWidth; x++) {
        char tileType = lines[y].charAt(x);
        allTiles[x][y] = new Tile(x*indivudalTileWidth, y*indivudalTileHeight, indivudalTileWidth, indivudalTileHeight, tileType);
        println(x,y);
      }
    }
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
    if (key == 'w'){
         
    }



  }
}