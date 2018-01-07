class BoardAi {
  Tile[][] tempBoard;
  int aiX, aiY, aiMoves;
  char aiChar;
  boolean stopAi;
  BoardAi(int boardXWidth, int boardYHeight, int _aiX, int _aiY ,char _aiChar) {
    tempBoard = new Tile[boardXWidth][boardYHeight];
    aiX = _aiX;
    aiY = _aiY;
    aiMoves = 0;
    aiChar = _aiChar;
  }

  void boardAiDrawLoop(Tile[][] currentTempBoard) {
    importCurrentBoard(currentTempBoard);
      aiHandler();
      exportCurrentBoard();
    
    
  }


  void importCurrentBoard(Tile[][] _currentTempBoard) {
    tempBoard = _currentTempBoard;
    stopAi = false;
  }
  
  Tile[][] exportCurrentBoard(){
    return tempBoard;
  }

  boolean isAiDoneMoving() {
    if (aiMoves >= 3) {
      return true;
    }
    return false;
  }

  void aiHandler() {
    int whichWayToMove;
    whichWayToMove =  int(random(1, 5));

    if (whichWayToMove == 1 && aiY + 1 <= 24 ) {  //checkerCode('A',aiX,aiY + 1)) {// move down
      if (tempBoard[aiX][aiY +1 ].checker(aiChar)) {
        aiMoves -=1;
      }
      tempBoard[aiX][aiY + 1].switchTileTo(aiChar);
      aiY = aiY +1;
      aiMoves ++;
    } 
    else if (whichWayToMove == 2 && aiY -1 >= 0) {// checkerCode('A',aiX,aiY -1)) {// move up
      if (tempBoard[aiX][aiY - 1].checker(aiChar)) {
        aiMoves -=1;
      }
      tempBoard[aiX][aiY -1].switchTileTo(aiChar);
      aiY = aiY -1;
      aiMoves ++;
    } 
    else if (whichWayToMove == 3 &&  aiX + 1 <= 24) {//checkerCode('A',aiX + 1,aiY)) {// move right
      if (tempBoard[aiX + 1][aiY].checker(aiChar)) {
        aiMoves -=1;
      }
      tempBoard[aiX +1][aiY].switchTileTo(aiChar);
      aiX = aiX +1;
      aiMoves++;
    } 
    else if (whichWayToMove == 4 && aiX -1 >= 0 ) {//checkerCode('A',aiX -1 ,aiY)) {// move left
      if (tempBoard[aiX - 1][aiY].checker(aiChar)) {
        aiMoves -=1;
      }
      tempBoard[aiX -1 ][aiY].switchTileTo(aiChar);
      aiX = aiX -1;
      aiMoves++;
    }
  }
}