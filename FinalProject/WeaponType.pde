// use floats for everythihg
class WeaponType {
  float dmg,hitSpeed,range,behavior,x,y,w,h;
  PImage thePicOfTheWeapon;
  WeaponType(float amountOfDmg, float hitSpeedOfWeapon,float rangeOfWeapon, String theImage, float howItActs, float ___x, float ___y,float ___w,float ___h) {
    dmg = amountOfDmg;
    hitSpeed = hitSpeedOfWeapon;
    range = rangeOfWeapon;
    thePicOfTheWeapon = loadImage(theImage);
    behavior = howItActs;
    x = ___x;
    y = ___y;
    w = ___w;
    h = ___h;
}
  void display() {
    image(thePicOfTheWeapon, x,y,w,h);   
  }
  
  void move(float currentX, float currentY) {
    x = currentX;
    y = currentY;
  
  
  }
  void attack(Stickman theThingToAttack) {
    if(mousePressed && theThingToAttack.x == x) {
      theThingToAttack.health -= dmg;
    }
  }

}