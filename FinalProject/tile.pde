class Tile {
  float x, y;
  float w, h;
  char tileType;

  Tile(float _x, float _y, float _w, float _h, char _tileType) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    tileType = _tileType;
    
    if(tileType == 'o'){
      fill(255); // this is for empty space
    }
    else if(tileType == 'b') {
      fill(0,255,0); // this is for our base
    }
    else if(tileType == 'B') {
      fill(255,0,0); // for other town halls;
    }


}

  void display() {
    rect(x, y, w, h);
  }

}