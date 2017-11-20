class TheGameSquare {
  int [][] theLargeGrid;
  int cols, rows;
  float widthOfBoard, heightOfBoard;

  
  
  TheGameSquare() {
    cols = width/5;
    rows = height/5;
    theLargeGrid = new int[cols][rows];
    widthOfBoard = width/5;
    heightOfBoard = height/5;
    
    
    
  }

  void drawBoard() {
    for(int x = 0; x < cols; x++){
      for(int y = 0; y < rows; y++) {
        rect(x*widthOfBoard,y*heightOfBoard,widthOfBoard,heightOfBoard);
      
      }
    }
  
  
  }

}