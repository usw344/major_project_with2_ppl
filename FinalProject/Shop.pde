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
    displayShop();// display all the buttons
    displaySectionLevel();// show which level each value is at
    upgradOnClick();// if you click on those buttons level up that value
  }

  void displayShop() {
    armourButton.displayButton();
    speedButton.displayButton();
    weaponButton.displayButton();
    
    text(int(theGoldValue), width-width/3,height/2);
  }
  void displaySectionLevel() {
    //display level of the box
    armourButton.theText("Armour Level = " + str(armourLevel));
    speedButton.theText("Speed Level = " +str(speedLevel));
    weaponButton.theText("Attack Level = " + str(weaponLevel));
  }
  void upgradOnClick() {
    fill(0);
    text(armourCost,x,y*2 - y/5);
    
    // check to see if button is clicked and you have the money.
    // all these if follow that logic
    
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


  void getGoldValue(float ourGold){
    // used in main file. It finds your current amount of gold
    theGoldValue = ourGold;
  }

  float returnUpdatedGoldValue(){
    // sends back the gold after you have made your upgrade
    return theGoldValue;
    
  }

}