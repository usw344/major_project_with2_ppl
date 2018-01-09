class Ammo {
  float x, y, dx, dmg, w, h, restLocal;
  PImage spirte;
  boolean isShooting; //isItTouchingTheGround, isDisplaying

  Ammo(float _x, float _y, float _dx, float _dmg, String _ammoPicToload, float _w, float _h, boolean _isShooting) { //boolean _isItTouchingTheGround, boolean _isDisplaying){
    x = _x;
    restLocal = _x;
    y = _y;
    dx = _dx * 10;
    dmg = _dmg;
    w = _w;
    h = _h;
    isShooting = false;
    
    //isItTouchingTheGround = _isItTouchingTheGround;
    //isDisplaying = _isDisplaying;
    spirte = loadImage(_ammoPicToload);
  }
  
  
  void shootDrawLoop(){
    println(isShooting);
    display(); 
    moveBullet();
    reset();
  }
  
  void display(){
    if(isShooting){
      image(spirte,x,y,w,h);
    }
  }
  
  
  void moveBullet(){
    if(isShooting){
      x += dx;
      
    }
  
  }

  void reset(){
    if(x > width){
      isShooting = false;
      x = restLocal;
    
    }
  
  }




}