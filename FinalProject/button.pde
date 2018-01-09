// made by Muhammad

//instuctions on how to use 
// first use the .display and tell it where to draw
// then also use the .isTheButtonBeingClicked and tell it what state to change to if the button is clicked
// .thetext to add the text to your button
// the object does all the rest



///////was working in stickman on weapon

class Button {
  float buttonX,buttonY,buttonHeight,buttonWidth; 
  boolean isButtonClicked;
  
  Button() {
    isButtonClicked = false;
  }
  void displayButton(float x, float y, float w,float h) {
    rectMode(CENTER);
    buttonX = x;
    buttonY = y;
    buttonHeight = h;
    buttonWidth = w;
    
    if (isButtonClicked) {// giving the hovering effect
      fill(255,57,57);
    }
    else {
      fill(252,0,0);
    }
    
    rect(buttonX,buttonY,buttonWidth,buttonHeight);  
}
  void isTheButtonBeingClicked(int objState) {
    float halftheButtonSizeX =  buttonWidth/2;
    float halftheButtonSizeY = buttonHeight/2;
    // basic collsion detection
    if (mouseX > buttonX - halftheButtonSizeX && mouseX < buttonX - halftheButtonSizeX+ buttonWidth && mouseY > buttonY - halftheButtonSizeY && mouseY < buttonY - halftheButtonSizeY + buttonHeight) {
      
      isButtonClicked = true;// setting it true here to change the color
      
      if (mousePressed) {
        doTheAction(objState);// change the state
      }
    }
    
    else {
      isButtonClicked = false;
    }
  
  }

  void doTheAction(int stateVarNum) {
    state = stateVarNum;
    
  }

  void theText(String blank) {
    textSize(buttonWidth/6);
    fill(255); 
    text(blank,buttonX - buttonWidth/5,buttonY + buttonHeight/8);// gives you a centerd text
  }


}