TheGameSquare b1;
Stickman s1;

void setup() {
  fullScreen();
  b1 = new TheGameSquare();
  //s1 = new Stickman();
  


}


void draw() {
  background(0);
  b1.drawBoard();

  //s1.display();
  //s1.movement();
  

}