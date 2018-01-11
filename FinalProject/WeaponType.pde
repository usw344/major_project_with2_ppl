// use floats for everythihg
class WeaponType {
  float dmg,hitSpeed,range,x,y,w,h, updatedX;
  //int behavior;
  Ammo ammo1, aiAmmo;
  PImage thePicOfTheWeapon;
  float weaponLvl;
  
  WeaponType(float amountOfDmg, float hitSpeedOfWeapon,float rangeOfWeapon, String theImage, int howItActs, float __levelOfWeapon ,  float ___x, float ___y,float ___w,float ___h) {
    dmg = amountOfDmg;
    hitSpeed = hitSpeedOfWeapon;
    range = rangeOfWeapon;
    thePicOfTheWeapon = loadImage(theImage);
    //behavior = howItActs;
    x = ___x;
    y = ___y;
    w = ___w;
    h = ___h;
    ammo1 = new Ammo(x,y,2,20,"arrow.png",w,h);
    weaponLvl = __levelOfWeapon;
    //aiAmmo = new Ammo(x,y,2,20,"arrow.png",w,h);
}
  void display(float currentLocaltionOfStickman) {
    updatedX = currentLocaltionOfStickman;
    image(thePicOfTheWeapon, x + w/10,y - h/15 ,w/2,h/5);   
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
     }
  
    
    
    
    
    //dmg = updatedDamage;
    //if(mousePressed && theThingToAttack.x / x < 1.4 && weaponLvl <= 1) {
      
    //  theThingToAttack.health -= dmg;
    //  ammo1.shootDrawLoop();
    //}
    
    //  if(theThingToAttack.x / ammo1.x < 1.4){
      
    //    theThingToAttack.health -= dmg;
    //    ammo1.x = x - 20;
    //  }
    //}
  


  void aiAttack(Stickman _theThingToAttack,float updatedDamage){
    if(_theThingToAttack.x < x){
      //ammo1.shootDrawLoop();
      _theThingToAttack.health -= dmg;
    }
  
  }

}