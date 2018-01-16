// use floats for everythihg







///FINISH INVERTING
class WeaponType {
  float dmg,hitSpeed,range,x,y,w,h, updatedX, updatedY;
  //int behavior;
  Ammo ammo1, aiAmmo;
  PImage thePicOfTheWeapon,inverted;
  float weaponLvl;
  
  WeaponType(float amountOfDmg, float hitSpeedOfWeapon,float rangeOfWeapon, String theImage, int howItActs, float __levelOfWeapon ,  float ___x, float ___y,float ___w,float ___h, String _inverted) {
    dmg = amountOfDmg;
    hitSpeed = hitSpeedOfWeapon;
    range = rangeOfWeapon;
    thePicOfTheWeapon = loadImage(theImage);
    inverted = loadImage(_inverted);
    //behavior = howItActs;
    x = ___x;
    y = ___y;
    w = ___w;
    h = ___h;
    ammo1 = new Ammo(x + w/10,y - h/30,2,20,"arrow.png",w/4,h/4);
    weaponLvl = __levelOfWeapon;
    //aiAmmo = new Ammo(x,y,2,20,"arrow.png",w,h);
}

  void display(float currentLocaltionOfStickman) {
    updatedX = currentLocaltionOfStickman;
    updatedY = currentLocaltionOfStickman;
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
  void attack(Stickman theThingToAttack,float updatedDamage) {
    //anything that is a 1 is melee and 2 is shooting
     if(ammo1.isHittingTarget(theThingToAttack)){
       theThingToAttack.health -= 10;
     }
     ammo1.shootDrawLoop(x,updatedX);
     ammo1.shootDrawLoop(y,updatedY);
     }
  

  void aiAttack(Stickman _theThingToAttack,float updatedDamage){
    if(_theThingToAttack.x < x){
      //ammo1.shootDrawLoop();
      _theThingToAttack.health -= dmg;
    }
  
  }

}