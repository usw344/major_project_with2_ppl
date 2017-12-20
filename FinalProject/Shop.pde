class Shop{
  int shopState;
  Button[] choices;
  int numberOfButtons;
  float x,y,w,h;
  
  Shop(int _shopState, int _numberChoices) {
    shopState = _shopState;
    choices = new Button[_numberChoices];
    numberOfButtons = _numberChoices;
    x = 50;
    y = 200;
    w = 200;
    h = 101;
    
  }
  
  void display() {
    x = 50;
    for(int i = 0; i <numberOfButtons; i++){
      choices[i] = new Button();
      choices[i].displayButton(x,y,w,h);
      choices[i].isTheButtonBeingClicked(1);
      if(i == 1){
        fill(0);
        choices[i].theText("this does nothing");
      }
      
      x += w + w/6;
    }
  }
  
}