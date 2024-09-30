// declaring the class
class Player{
  // class variables
  int x;
  int y;
  int playerWidth;
  int playerHeight;
  color C1;
  boolean isMovingUp;
  boolean isMovingDown;
  boolean isMovingLeft;
  boolean isMovingRight;
  int p1x = 50;
 // int playerHeight = height/2;
  int p2x = 1100;
  
  int left;
  int right;
  int top;
  int bottom;
  
  Player(int startingX, int startingY, int startingWidth, int startingHeight, color c){
    // initialize class variables
    x = startingX;
    y = startingY;
    C1 = c;
    playerWidth = startingWidth;
    playerHeight = startingHeight;
    
    left = x - playerWidth/2;
    right = x + playerWidth/2;
    top = y - playerHeight/2;
    bottom = y + playerHeight/2;
  }
  
  void render(){
    fill(C1);
    strokeWeight(3);
    rect(x, y, playerWidth, playerHeight);
  }
  
  void move(){
    left = x - playerWidth/2;
    right = x + playerWidth/2;
    top = y - playerHeight/2;
    bottom = y + playerHeight/2;
    
  if (isMovingUp == true) {
   y -= playerSpeed;
  }
  if (isMovingDown == true){
    y += playerSpeed;
  }
  if (isMovingLeft == true){
    x -= playerSpeed;
  }
  if (isMovingRight == true){
    x += playerSpeed;
  }
  }
  
 void borders() {
  if (left < 0) {
    x = playerWidth / 2;
  }
  if (right > width) {
    x = width - playerWidth / 2;
  }
  if (top < 0) {
    y = playerHeight / 2;
  }
  if (bottom > height) {
    y = height - playerHeight / 2;
  }
}


boolean collisions(int p1x, int p1y, int p2x, int p2y) {
  int p1Top = p1y - playerHeight / 2;
  int p1Left = p1x - playerWidth / 2;
  int p1Right = p1x + playerWidth / 2;
  int p1Bottom = p1y + playerHeight / 2;
  
  int p2Top = p2y - playerHeight / 2;
  int p2Left = p2x - playerWidth / 2;
  int p2Right = p2x + playerWidth / 2;
  int p2Bottom = p2y + playerHeight / 2;
  
  if (p1Left <= p2Right &&
      p1Right >= p2Left &&
      p1Top <= p2Bottom &&
      p1Bottom >= p2Top) {
    return true;
    //if (ding.isPlaying() == false){
    //ding.play();
  }
  else {
    return false;
  }
      }

void reset(Player aPlayer, Flag aFlag, Base aBase, Base aBase2){
  aPlayer.y = aBase2.y;
  aPlayer.x = aBase2.x;
  aFlag.x = aBase.x;
  aFlag.y = aBase.y;
}
    
}
