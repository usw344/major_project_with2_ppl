class BoardAi {
  Tile[][] tempBoard;
  int aiX, aiY, aiMoves;
  char aiChar;
  boolean stopAi;
  Stickman thisAiStickman;
  BoardAi(int boardXWidth, int boardYHeight, int _aiX, int _aiY ,char _aiChar, float _stickmanXLocation, float _speedOfStickman, float attackValueOfAI, String imageOfAiSticman) {
    tempBoard = new Tile[boardXWidth][boardYHeight];
    aiX = _aiX;
    aiY = _aiY;
    aiMoves = 0;
    aiChar = _aiChar;
    thisAiStickman = new Stickman(width-100, _speedOfStickman, attackValueOfAI, imageOfAiSticman);
  }

  void boardAiDrawLoop(Tile[][] currentTempBoard) {
    importCurrentBoard(currentTempBoard);
      aiHandler();
      exportCurrentBoard();
    
    
  }

  void aiStickManBattle(Stickman _humanSticman){
    thisAiStickman.display();
    thisAiStickman.ai(_humanSticman);
  //  thisAiStickman.aiWeaponHandler(_humanSticman);
    thisAiStickman.healthBar();
    
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

    if (whichWayToMove == 1 && aiY + 1 <= 24 && tempBoard[aiX][aiY +1 ].checker(aiChar) == false) { // move down
      tempBoard[aiX][aiY + 1].switchTileTo(aiChar);
      aiY = aiY +1;
    } 
    else if (whichWayToMove == 2 && aiY -1 >= 0 && tempBoard[aiX][aiY - 1].checker(aiChar) == false) {// move up
      tempBoard[aiX][aiY -1].switchTileTo(aiChar);
      aiY = aiY -1;
    } 
    else if (whichWayToMove == 3 &&  aiX + 1 <= 24 && tempBoard[aiX + 1][aiY].checker(aiChar) == false) {// move right
      tempBoard[aiX +1][aiY].switchTileTo(aiChar);
      aiX = aiX +1;
    } 
    else if (whichWayToMove == 4 && aiX -1 >= 0 && tempBoard[aiX - 1][aiY].checker(aiChar) == false) {// move left
      tempBoard[aiX -1 ][aiY].switchTileTo(aiChar);
      aiX = aiX -1;
    }
    else{
      //
    }
}
}