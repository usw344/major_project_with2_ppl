class Tile {
  float x, y;
  float w, h;
  char tileType;
  color rgb;
  Tile(float _x, float _y, float _w, float _h, char _tileType) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    tileType = _tileType;
    
    if(tileType == 'o'){
      rgb = color(255); // this is for empty space
    }
    if(tileType == 'b') {
      rgb = color(0,255,0); // this is for our base
    }
    if(tileType == 'B') {
      rgb = color(255,0,0); // for other town halls;
    }


}

  void display() {
    fill(rgb);
    stroke(100);
    rect(x, y, w, h);
  }

}