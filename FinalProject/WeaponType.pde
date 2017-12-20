// use floats for everythihg
class WeaponType {
  float dmg,hitSpeed,range,x,y,w,h;
  int behavior;
  Ammo ammo1;
  PImage thePicOfTheWeapon;
  
  WeaponType(float amountOfDmg, float hitSpeedOfWeapon,float rangeOfWeapon, String theImage, int howItActs, float ___x, float ___y,float ___w,float ___h) {
    dmg = amountOfDmg;
    hitSpeed = hitSpeedOfWeapon;
    range = rangeOfWeapon;
    thePicOfTheWeapon = loadImage(theImage);
    behavior = howItActs;
    x = ___x;
    y = ___y;
    w = ___w;
    h = ___h;
    ammo1 = new Ammo(x,y,2,5,20,"arrow.png",w,h);
}
  void display() {
    image(thePicOfTheWeapon, x + w/10,y - h/15 ,w/2,h/5);   
  }
  
  void move(float currentX, float currentY) {
    x = currentX;
    y = currentY;
  
  
  }
  void attack(Stickman theThingToAttack) {
    //anything that is a 1 is melee and 2 is shooting
    
    if(mousePressed && theThingToAttack.x / x < 1.4 && behavior == 1) {
      theThingToAttack.health -= dmg;
      
    }
    if(behavior == 2){
      ammo1.fire();
      if(theThingToAttack.x / ammo1.x < 1.4){
        theThingToAttack.health -= dmg;
        ammo1.x = x - 20;
      }
    }
  }

  void myDraw() {
    if (mousePressed) {
      ammo1.fire();
      ammo1.display();
    }
  }



}