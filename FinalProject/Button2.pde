// made by Muhammad

//instuctions on how to use 
// first use the .display and tell it where to draw
// then also use the .isTheButtonBeingClicked and tell it what state to change to if the button is clicked
// .thetext to add the text to your button
// the object does all the rest

class Button2 {
  float buttonX,buttonY,buttonHeight,buttonWidth; 
  boolean isButtonClicked;
  
  Button2(float x, float y, float w,float h) {
    isButtonClicked = false;
    buttonX = x;
    buttonY = y;
    buttonHeight = h;
    buttonWidth = w;
    
  }
  void displayButton() {
    rectMode(CENTER);
    if (isButtonClicked) {// giving the hovering effect
      fill(165,5,150);
    }
    else {
      fill(95,5,86);
    }
    
    rect(buttonX,buttonY,buttonWidth,buttonHeight);  
}
  int isTheButtonBeingClicked(int objCounter) {
    float halftheButtonSizeX =  buttonWidth/2;
    float halftheButtonSizeY = buttonHeight/2;
    // basic collsion detection
    if (mouseX > buttonX - halftheButtonSizeX && mouseX < buttonX - halftheButtonSizeX+ buttonWidth && mouseY > buttonY - halftheButtonSizeY && mouseY < buttonY - halftheButtonSizeY + buttonHeight) {
      
      isButtonClicked = true;// setting it true here to change the color
      
      if (mousePressed) {
       return objCounter += 1;
      }
    }
    
    else {
      isButtonClicked = false;
    }
  return objCounter;
  }

  void theText(String blank) {
    textSize(buttonWidth/6);
    fill(255);
    
    text(blank,buttonX - buttonWidth/5,buttonY + buttonHeight/8);// gives you a centerd text
  }


}