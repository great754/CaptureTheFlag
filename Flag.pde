class Flag {  
  // declare variables
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  boolean playerHasFlag = true;
  
  // constructor
  Flag(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  
  void render(){
    fill(0, 255, 0);
    rect(x, y, w, h);
  }
  
  
  boolean playerWithFlag(Player aPlayer){
  if (aPlayer.right >= left &&
      aPlayer.left <= right &&
      aPlayer.top <= bottom &&
      aPlayer.bottom >= top &&
      playerHasFlag == true)
      {
        return true;
  
}
else {return false;
}
  }
  
  
  void moveFlag(Player aPlayer) {
  if (playerWithFlag(aPlayer)) {
    x = aPlayer.x;
    y = aPlayer.y;
  }
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  

}
  
  
