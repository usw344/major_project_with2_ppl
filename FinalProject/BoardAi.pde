class BoardAi {
  Tile[][] tempBoard;
  int aiX, aiY, aiMoves;
  int aiLives;
  
  char aiChar;
  boolean stopAi;
  
  Stickman thisAiStickman;
  
  BoardAi(int boardXWidth, int boardYHeight, int _aiX, int _aiY ,char _aiChar, float _stickmanXLocation, float _speedOfStickman, float attackValueOfAI, String imageOfAiSticman, String invertedMan, boolean _isFacingL,int lives) {
    tempBoard = new Tile[boardXWidth][boardYHeight];// a temp arrray to handle the board. We push it every few frames
    aiX = _aiX;
    aiY = _aiY;
    
    aiMoves = 0;
    
    aiChar = _aiChar;
    thisAiStickman = new Stickman(width-100, _speedOfStickman, attackValueOfAI, imageOfAiSticman, invertedMan, _isFacingL);
    
    aiLives = lives;
  }

  void boardAiDrawLoop(Tile[][] currentTempBoard) {
    importCurrentBoard(currentTempBoard);// pulls the current allTiles[][] and makes our temp array
    
    aiHandler();// does all the neat stuff of this class
    
    exportCurrentBoard();// and pushes back the changes that have been made
    
    
  }

  boolean amIDead(){
    if(aiLives < 0){
      return true;
    
    }
    return false;
  
  }

  /// all the code needed to do battle
  void aiStickManBattle(Stickman _humanSticman){
    thisAiStickman.display();// show weapon
    
    thisAiStickman.ai(_humanSticman);// move around
    
    thisAiStickman.healthBar();// display ai healthbar
    
  }



  // import the current board
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

  /// prevents the ai from eating up water and hills squars
  boolean checkForObstcles(int _x, int _y){
    if(tempBoard[_x][_y].checker('w') ||tempBoard[_x][_y].checker('H')) {// w and h are water and hill
      return false;
    }
    return true;
  
  }


  void aiHandler() {/// the crux of this class
    int whichWayToMove;
    whichWayToMove =  int(random(1, 5));// pick at random which direction to move

    //// if statement explain. First part checks if you are in the array. Second makes it so that the Ai can not keep expanding on its own land
    if (whichWayToMove == 1 && aiY + 1 <= 24 && tempBoard[aiX][aiY +1 ].checker(aiChar) == false) { // move down
      
      if(checkForObstcles(aiX,aiY + 1)){// run the ovs checker code
        tempBoard[aiX][aiY + 1].switchTileTo(aiChar);
        aiY = aiY +1;// updated the where to move from next
      }
    } 
    /// all the other follow this rule
    else if (whichWayToMove == 2 && aiY -1 >= 0 && tempBoard[aiX][aiY - 1].checker(aiChar) == false) {// move up
      
      if(checkForObstcles(aiX,aiY - 1)){
        tempBoard[aiX][aiY -1].switchTileTo(aiChar);
        aiY = aiY -1;
      }
    } 
    else if (whichWayToMove == 3 &&  aiX + 1 <= 24 && tempBoard[aiX + 1][aiY].checker(aiChar) == false) {// move right
      
      if(checkForObstcles(aiX + 1,aiY)){
        tempBoard[aiX +1][aiY].switchTileTo(aiChar);
        aiX = aiX +1;
      }
    } 
    else if (whichWayToMove == 4 && aiX -1 >= 0 && tempBoard[aiX - 1][aiY].checker(aiChar) == false) {// move left
      
      if(checkForObstcles(aiX - 1,aiY)){
        tempBoard[aiX -1 ][aiY].switchTileTo(aiChar);
        aiX = aiX -1;
    }
    }

}
}