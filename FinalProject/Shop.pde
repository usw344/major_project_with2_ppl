class Shop {
  float armourLevel, speedLevel, weaponLevel;
  float x, y, w, h;
  
  float theGoldValue;
  Button2 armourButton, speedButton, weaponButton; 


  Shop() {
    armourLevel = 0;
    speedLevel = 0;
    weaponLevel = 0;
    x = 150;
    y = 100;
    w = 200;
    h = 100;
    
    theGoldValue = 0;

    // making calculations for button location
    armourButton = new Button2(x, y, w, h);
    speedButton = new Button2(x, y+h + h/2, w, h);
    weaponButton = new Button2(x, y+h* 3, w, h);
  }

  void myShopDrawLoop() {
    displayShop();
    displaySectionLevel();
    upgradOnClick();
  }

  void displayShop() {
    armourButton.displayButton();
    speedButton.displayButton();
    weaponButton.displayButton();
  }
  void displaySectionLevel() {
    // just for devolpment reasons, want to see the level of the box
    armourButton.theText("Armour Level = " + str(armourLevel));
    speedButton.theText("Speed Level = " +str(speedLevel));
    weaponButton.theText("Attack Level = " + str(weaponLevel));
  }
  void upgradOnClick() {
    if (armourButton.isTheButtonBeingClicked()) {
      armourLevel += 0.5;
    }
    if (speedButton.isTheButtonBeingClicked()) {
      speedLevel += 0.5;
    }
    if (weaponButton.isTheButtonBeingClicked()) {
      weaponLevel += 0.5;
    }
  }

  boolean doIHaveEnoughGold(){
       
    return false;
  }

  void getGoldValue(float ourGold){
    theGoldValue = ourGold;
  }

  float returnUpdatedGoldValue(){
    return theGoldValue;
  }

}