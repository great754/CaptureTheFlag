class Obstacle{
  // declare the variables
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  
  // constructor
  Obstacle(int newX, int newY, int newW, int newH){
    x = newX;
    y = newY;
    w = newW;
    h = newH;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
  }
  
  void render(){
    rectMode(CENTER);
    fill(255);
    strokeWeight(0);
    rect(x, y, w, h);
  }
  
  void playerCollide(Player aPlayer){
    // check if player is colliding from left
    if (aPlayer.top <= bottom &&
        aPlayer.bottom >= top &&
        aPlayer.right > left &&
        aPlayer.left <= left){
          aPlayer.isMovingRight = false;
          aPlayer.x = left - aPlayer.playerWidth/2;
        }
        // check if player is colliding from right
        if (aPlayer.top <= bottom &&
            aPlayer.bottom >= top &&
            aPlayer.left < right &&
            aPlayer.right >= right){
              aPlayer.isMovingLeft = false;
              aPlayer.x = right + aPlayer.playerWidth/2;
            }
            
            // colliding from top
            if (aPlayer.left <= right &&
                aPlayer.right >= left &&
                aPlayer.bottom > top &&
                aPlayer.top <= top){
                  aPlayer.isMovingDown = false;
                  aPlayer.y = top - aPlayer.playerHeight/2;
                }
                // colliding from bottom
                if (aPlayer.left <= right &&
                    aPlayer.right >= left &&
                    aPlayer.top < bottom &&
                    aPlayer.bottom >= bottom){
                      aPlayer.isMovingUp = false;
                      aPlayer.y = bottom + aPlayer.playerHeight/2;
                    }
  }
  
  
  
}
