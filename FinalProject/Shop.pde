class Shop {
  float armourLevel, speedLevel, weaponLevel;
  float x, y, w, h;
  
  float theGoldValue;
  Button2 armourButton, speedButton, weaponButton; 
  
  float armourCost, speedCost, weaponCost;


  Shop() {
    armourLevel = 0;
    speedLevel = 0;
    weaponLevel = 0;
    x = 150;
    y = 100;
    w = 200;
    h = 100;
    
    armourCost = 2;
    speedCost = 2;
    weaponCost = 2;
    
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
    
    text(int(theGoldValue), width-width/3,height/2);
  }
  void displaySectionLevel() {
    // just for devolpment reasons, want to see the level of the box
    armourButton.theText("Armour Level = " + str(armourLevel));
    speedButton.theText("Speed Level = " +str(speedLevel));
    weaponButton.theText("Attack Level = " + str(weaponLevel));
  }
  void upgradOnClick() {
    fill(0);
    text(armourCost,x,y*2 - y/5);
    if (armourButton.isTheButtonBeingClicked() && weaponCost < theGoldValue) {
      armourCost += armourLevel * 2;
      theGoldValue -= armourCost;
      armourLevel += 0.5;
      
    }
    fill(0);
    text(speedCost,x, y+h + h + h/3);
    if (speedButton.isTheButtonBeingClicked() && speedCost < theGoldValue) {
      speedCost += speedLevel * 2;
      theGoldValue -= speedCost;
      speedLevel += 0.5;
    }
    fill(0);
    text(weaponCost,x,y+h* 4);
    if (weaponButton.isTheButtonBeingClicked() && weaponCost < theGoldValue) {
      weaponCost += weaponLevel * 2;
      theGoldValue -= weaponCost;
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