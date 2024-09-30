// declare the class
class Score{
  
  int x;
  int y;
  int score;
  int initialScore = 0;
  int winningScore = 3;
  PFont font;
  color color1;
  
  Score(int startingX, int startingY, int startingScore, int C1){
    x = startingX;
    y = startingY;
    score = startingScore;
    font = createFont("fFinish.ttf", 64);
    color1 = C1;
  }
  
  void renderScore(){
    textSize(64);
    textAlign(CENTER);
    textFont(font);
    fill(color1);
    text(score, x, y);
  }
  
  void reset(){
    score = 0;
  }
  
  
}
