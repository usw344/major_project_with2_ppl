class Shop{
  int shopState;
  int numberOfButtons;
  float x,y,w,h;
  Button2 theButton;
  float weaponState; 
  
  Shop(int _shopState, int _numberChoices,float weaponObjectState) {
    shopState = _shopState;
    numberOfButtons = _numberChoices;
    weaponState = 1;
    x = 300;
    y = 200;
    w = 200;
    h = 100;
    theButton = new Button2(x,y,w,h);
    weaponState =  weaponObjectState;
    
  }
  
  void display() {
    theButton.displayButton();
    
  }
  float makeTheCalcForWeaponLvl(float theCurrentWeapon){
    return theButton.isTheButtonBeingClicked(theCurrentWeapon);
  
  
  }
  
}