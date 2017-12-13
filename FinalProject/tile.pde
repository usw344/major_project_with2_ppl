class Tile {
  float x, y;
  float w, h;
  char tileType;
  color rgb;
  PImage playerHut;
  Tile(float _x, float _y, float _w, float _h, char _tileType) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    tileType = _tileType;
    
    if(tileType == 'o'){
      rgb = color(100); // this is for empty space
    }
    if(tileType == 'b') {
      rgb = color(0,255,0); // this is for our base
    }
    if(tileType == 'B') {
      //rgb = color(100);
      rgb = color(255,0,0); // for other town halls uncomment this if you want to debug;
    }
    if (tileType == 'O') {
      rgb = color(150,255,150);
    }
    if (tileType == 'A') {
      println("true");
      rgb = color(250,124,20);
    }
}

  void switchTileTo(char _tileType) {
    tileType = _tileType;
    if(tileType == 'o'){
      rgb = color(100); // this is for empty space
    }
    if(tileType == 'b') {
      rgb = color(0,255,0); // this is for our base
    }
    if(tileType == 'B') {
      rgb = color(255,0,0); // for other town halls;
    }
    if (tileType == 'O') { //our tiles
      rgb = color(150,255,150);
    }
    if (tileType == 'A') {
      println("true");
      rgb = color(250,124,20);
    }
  }
  boolean checker(char tileTypeToCheck) {
    if(tileType == tileTypeToCheck) {
      return true;
    }
    else {
      return false;
    }
  
  }

  void display() {
    rectMode(CORNER);
    fill(rgb);
    stroke(0);
    rect(x, y, w, h);
  }

}