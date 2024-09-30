class Base {
  int x;
  int y;
  int w;
  int h;
  color baseColor;
  int top;
  int bottom;
  int left;
  int right;
  

  Base(int startingX, int startingY, int startingW, int startingH, Player player) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    baseColor = player.C1;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  void render() {
    fill(baseColor);
    strokeWeight(0);
    rect(x, y, w, h);
  }
  
  boolean baseCollision(Flag aFlag){
    if (aFlag.right >= left &&
      aFlag.left <= right &&
      aFlag.top <= bottom &&
      aFlag.bottom >= top)
      {
        return true;
      }
      else {
        return false;
      }
  }
  
void playerSafe(Flag aFlag, Base aBase, Score aScore) {
    if (baseCollision(aFlag)) {
      aFlag.x = aBase.x;
      aFlag.y = aBase.y;
      aFlag.playerHasFlag = false;
      aScore.score++;
    }
    else {
      aFlag.playerHasFlag = true;
    }
  }
}
