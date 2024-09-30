class Fly {
  // declare variables
  int x;
  int y;
  int xSpeed;
  
  // Constructor
  Fly(int startingX, int startingY, int speed){
    x = startingX;
    y = startingY;
    xSpeed = speed;
  }
  
  void render(){
    fill(255);
    rect(x, y, 50, 50);
  }
  
  void move(){
    x = x+xSpeed;
  }
  
  void reset(){
    if (x - 1600 > width){
      x = (int) random(-1500, -1000);
    }
  }
  
}
