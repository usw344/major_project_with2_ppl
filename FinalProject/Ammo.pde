class Ammo {
  float x, y, dx, dmg, w, h, restLocal;
  PImage spirte;
  boolean isShooting; //isItTouchingTheGround, isDisplaying

  Ammo(float _x, float _y, float _dx, float _dmg, String _ammoPicToload, float _w, float _h) { //boolean _isItTouchingTheGround, boolean _isDisplaying){
    x = _x;
    restLocal = _x;
    y = _y;
    dx = _dx * 10;
    dmg = _dmg;
    w = _w;
    h = _h;
    isShooting = true;
    
    //isItTouchingTheGround = _isItTouchingTheGround;
    //isDisplaying = _isDisplaying;
    spirte = loadImage(_ammoPicToload);
  }
  
  boolean isHittingTarget(Stickman _theTarget){
    float targetX = _theTarget.x;
    float targetY = _theTarget.y;
    float targetW = _theTarget.w;
    float targetH = _theTarget.h;
    
    if(x > targetX - targetW/2 && x < targetX - targetW/2+ targetW && y > targetY - targetH/2 && y < targetY - targetH/2 + targetH){
      reset(restLocal);
      return true;
    }
    return false;
  }
  
  
  void shootDrawLoop(float _resetLocal){
    display(); 
    moveBullet();
    reset(_resetLocal);
    restLocal = _resetLocal;
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

  void reset(float _restLocal){
    if(x > width){
      isShooting = false;
      x = _restLocal;
    
    }
  
  }




}