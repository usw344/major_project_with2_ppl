class Ammo {
  float x, y, dx, dmg, w, h;
  PImage spirte;
  boolean isItTouchingTheGround, isDisplaying, isShooting;

  Ammo(float _x, float _y, float _dx, float _dmg, String _ammoPicToload, float _w, float _h, boolean _isShooting) { //boolean _isItTouchingTheGround, boolean _isDisplaying){
    x = _x;
    y = _y;
    dx = _dx;
    dmg = _dmg;
    w = _w;
    h = _h;
    isShooting = _isShooting;
    //isItTouchingTheGround = _isItTouchingTheGround;
    //isDisplaying = _isDisplaying;
    spirte = loadImage(_ammoPicToload);
  }
  
  void fire() {
   if (mousePressed) {
     isShooting = true;
   }
   if (isShooting) {
     x += dx;
   }
  }
  
  void comeBack(float _aiX) {
    if (x >= _aiX || x >= width) {
      
    }
  }
}