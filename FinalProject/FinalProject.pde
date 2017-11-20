TheGameSquare b1;
Stickman s1;

void setup() {
  fullScreen();
  //b1 = new TheGameSquare();
  s1 = new Stickman();
  


}


void draw() {
  //b1.drawBoard();
  background(0);
  s1.display();
  s1.movement();
  

}