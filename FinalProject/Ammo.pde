class Ammo{
  float x,y,dx,dy,dmg,w,h;
  PImage spirte;
  boolean isItTouchingTheGround, isDisplaying;
  
  Ammo(float _x, float _y, float _dx, float _dy, float _dmg, String _ammoPicToload, float _w, float _h) { //boolean _isItTouchingTheGround, boolean _isDisplaying){
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
    dmg = _dmg;
    w = _w;
    h = _h;
    //isItTouchingTheGround = _isItTouchingTheGround;
    //isDisplaying = _isDisplaying;
    spirte = loadImage(_ammoPicToload);
  }
  
  void display(){
    image(spirte,x,y,w,h);
  }
  
  
  void fire(int _x, boolean shootWhere) {
    if (shootWhere) {
      x += dx;
      if(x>=_x){
        x = -1000;
      }
    }
  }
}