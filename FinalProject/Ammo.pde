class Ammo {
  float x, y, dx, dmg, w, h, restLocal,restLocalY;
  PImage spirte;
  boolean isShooting, theShotHasHitEnemy; //isItTouchingTheGround, isDisplaying
  
  //constructor
  Ammo(float _x, float _y, float _dx, float _dmg, String _ammoPicToload, float _w, float _h) { //boolean _isItTouchingTheGround, boolean _isDisplaying){
    x = _x;
    restLocal = _x;
    y = _y;
    dx = _dx * 10;
    dmg = _dmg;
    w = _w;
    h = _h;
    isShooting = true;
    theShotHasHitEnemy = false;
    
    //isItTouchingTheGround = _isItTouchingTheGround;
    //isDisplaying = _isDisplaying;
    spirte = loadImage(_ammoPicToload);
  }
  
  boolean isHittingTarget(Stickman _theTarget){
    // for making colllsion detection easier
    float targetX = _theTarget.x;
    float targetY = _theTarget.y;
    
    float targetW = _theTarget.w;
    float targetH = _theTarget.h;
    
    // checks to see if the bullet has hit the ai stickman
    if(x > targetX - targetW/2 && x < targetX - targetW/2+ targetW && y > targetY - targetH/2 && y < targetY - targetH/2 + targetH){
      reset(restLocal,restLocalY);// this resets the ammo back to the human
      
      targetX += 100;// moves the other guy back
      
      theShotHasHitEnemy = true;
      return true;// returns true to trigger other things
    }
    return false;
  }
  
  ///// all the main functions put into a nice drawloop.
  void shootDrawLoop(float _resetLocal, float _updatedX, float _updatedY){
    display(_updatedX,_updatedY); 
    restLocalY = _updatedY;
    moveBullet();
    
    /// this checks if the bullet is off screen
    if (x > width){
      reset(_resetLocal,_updatedY);
    
  }
    restLocal = _resetLocal; // and always keep the y updated 
}
  
  void display(float __updatedX,float _yLocal){
    if(isShooting){// if we are allowed to fire then display
      
      // if we have hit either the enemy or out of screen set ammo back to x
      if(x > width || theShotHasHitEnemy){
        x = __updatedX;
        theShotHasHitEnemy = false;
      }
       
       image(spirte,x,y,w,h);
    }
  }
  
  
  void moveBullet(){
    ///// very simple, moves teh bullet by the dx
    if(isShooting){
      x += dx;
      
    }
  
  }

  void reset(float _restLocal,float _resetToY){
      /// keeps the bulllet "updadated" to where you alawys are
      isShooting = false;
      y = _resetToY;
      x = _restLocal; 

  }




}