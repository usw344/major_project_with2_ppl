// use floats for everythihg


///FINISH INVERTING
class WeaponType {
  float dmg,hitSpeed,range,x,y,w,h, updatedX, updatedY;
  //int behavior;
  Ammo ammo1;
  PImage thePicOfTheWeapon,inverted;
  float weaponLvl;
  float humanY;
  
  WeaponType(float amountOfDmg, float hitSpeedOfWeapon,float rangeOfWeapon, String theImage, int howItActs, float __levelOfWeapon ,  float ___x, float ___y,float ___w,float ___h, String _inverted) {
    dmg = amountOfDmg;
    hitSpeed = hitSpeedOfWeapon;
    range = rangeOfWeapon;
    
    thePicOfTheWeapon = loadImage(theImage);
    inverted = loadImage(_inverted);
    
    x = ___x;
    y = ___y;
    w = ___w;
    h = ___h;
    
    ammo1 = new Ammo(x + w/10,y - h/30,2,20,"arrow.png",w/4,h/4);
    weaponLvl = __levelOfWeapon;
    }

  void display(float currentLocaltionOfStickman) {
    // these are passed into the ammo, to ensure that whenever you fire, the shot comes from you not your last pos
    updatedX = currentLocaltionOfStickman;
    updatedY = currentLocaltionOfStickman;
    
    // based on which way the stickman is, we change the weapon as well
    if (humanPlayerStickMan.facingL) {
      image(inverted, x - w/10,y-4 ,w/2,h/5);   
    }
    else {
      image(thePicOfTheWeapon,x + w/10, y-4, w/2,h/5);
    }
  }
  
  
  void move(float currentX, float currentY) {
    x = currentX;
    y = currentY;
  
  
  }
  void attack(Stickman theThingToAttack,float updatedDamage,float setAmmoYTo) {
     // check to see if you hit ai   
     if(ammo1.isHittingTarget(theThingToAttack)){
       theThingToAttack.health -= 10;
     }
     // calling the shoot draw loop
     ammo1.shootDrawLoop(x,updatedX,humanY);
     
     }
  // after all of that has happend its time to reset the pos of the ammo
  void updateTheAmmo(float humanStickManY){
    humanY = humanStickManY;
  
  
  }

}