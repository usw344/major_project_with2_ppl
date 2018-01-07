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

    //letter legend
    // lowercase o: is grey space :: grey
    // b:           is human main base :: dark green
    // O:           is the land you conquered :: light green
    
    // H:           is hills
    // w:           is water
    
    // enemey color and letters
    // A:           is enemy orange conquerd land :: lightish orange color
    // B:           is enemy red conquerd land   ::  lightish red color
    // C:           is enemy black               ::  black color
    
    //M:            is enemy mongols             :: white color
    //T:            is enemey Timurids           :: is dark red
    
    if(tileType == 'C'){
      rgb = color(0);
    }
    if (tileType == 'o') {
      rgb = color(100); 
    }
    if (tileType == 'b') {
      rgb = color(0, 255, 0); 
    }
    if (tileType == 'B') {
      rgb = color(255, 0, 0); 
    }
    if (tileType == 'O') {
      rgb = color(150, 255, 150);
    }
    if (tileType == 'A') {
      rgb = color(250, 124, 20);
    }
    if(tileType == 'H'){
      rgb = color(33,131,203);
    }
  }

  void switchTileTo(char _tileType) {

    if(tileType == 'w'){
      tileType = 'w';
    }
    else{
      tileType = _tileType;
    }
    if(tileType == 'C'){
      rgb = color(0);
    }
    if (tileType == 'B') {
      rgb = color(255, 0, 0); 
    }
    
    if (tileType == 'o') {
      rgb = color(100); 
    }

    if (tileType == 'b') {
      rgb = color(0, 255, 0); 
    }

    if (tileType == 'O') { 
      rgb = color(150, 255, 150);
    }

    if (tileType == 'A') {
      //rgb = color(100);
      rgb = color(250, 124, 20);
    }
  }
  boolean checker(char tileTypeToCheck) {
    if (tileType == tileTypeToCheck) {
      return true;
    } else {
      return false;
    }
  }
  
  int checkForObstcle(char charToCheck){
    if(charToCheck == tileType && tileType == 'H'){
      return 1;
    }
    if(charToCheck == tileType && tileType == 'w'){
      return 2;
    }
    return 0;// for no obstcle in the way
  
  }

  void display() {
    rectMode(CORNER);
    fill(rgb);
    stroke(0);
    rect(x, y, w, h);
  }

  void animateWater() {
    if (tileType == 'w') {
      int choice  = int(random(1, 5));
      if (choice == 1) {
        rgb = color(2, 190, 240);
      } 
      else if(choice == 2) {
        rgb = color(116, 210, 234);
      }
      else if(choice == 3){
        rgb = color(120, 200, 255);
      }
      else if( choice == 4){
        rgb = color(100, 243, 255);
      }

}
  }
}