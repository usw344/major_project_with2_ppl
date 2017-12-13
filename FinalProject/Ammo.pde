class Ammo{
  float x,y,dx,dy,dmg,w,h;
  PImage spirte;
  
  Ammo(float _x, float _y, float _dx, float _dy, float _dmg, String _ammoPicToload, float _w, float _h){
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
    dmg = _dmg;
    w = _w;
    h = _h;
    spirte = loadImage(_ammoPicToload);
  }
  
  void display() {
    image(spirte,x,y,w,h);
  }
  
  void move(float currentX, float currentY) {
    x = currentX;
    y = currentY;
  }

}