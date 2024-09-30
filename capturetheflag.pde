import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;

Minim minim;
AudioPlayer background;
AudioPlayer ding;
AudioPlayer slash;
AudioPlayer victory;

// declare variables
Animation blueAnimation;
Animation blueAnimation2;
Animation blueStanding;
Animation blueStanding2;
Animation redAnimation;
Animation redAnimation2;
Animation redStanding;
Animation birdFlying;
Animation dragonFlying;
PFont font;

PImage theBackground;
PImage scoreScroll;
PImage p1Wins;
PImage p2Wins;
PImage welcome;
PImage town;
PImage redFlag;
PImage blueFlag;
PImage redBase;
PImage blueBase;
PImage redFlag2;
PImage blueFlag2;
PImage[] noBlueRight = new PImage[3];
PImage[] noBlueLeft = new PImage[3];
PImage[] blueRight = new PImage[3];
PImage[] blueLeft = new PImage[3];
PImage[] redLeft = new PImage[3];
PImage[] redRight = new PImage[3];
PImage[] noRedRight = new PImage[3];
PImage[] noRedLeft = new PImage[3];
PImage[] bird = new PImage[7];
PImage[] dragon = new PImage[20];


int state = 0;
int winningScore = 3;
//SoundFile background;
//SoundFile ding;
SoundFile swoosh;
int playerSpeed = 4;
Player player1;
Player player2;
Obstacle o1;
Obstacle skyObstacle;
Flag p1Flag;
Flag p2Flag;
Base p1Base;
Base p2Base;
Score p1Score;
Score p2Score;
Fly redBird;
Fly redDragon;

void setup(){
  size(1200, 800);
  player1 = new Player(80, height/2, 30, 60, color (255, 0, 0));
  player2 = new Player(1100, height/2, 30, 60, color (0, 0, 255));
  o1 = new Obstacle(width/2+10, 400, 150, 150);
  skyObstacle = new Obstacle(width/2, 50, 1300, 300);
  p1Flag = new Flag(100, height - 200, 20, 40);
  p2Flag = new Flag(1125, 220, 20, 40);
  font = createFont("fFinish.ttf", 64);
  minim = new Minim(this);
  background = minim.loadFile("backgroundsong.mp3");
  ding = minim.loadFile("ding.mp3");
  slash = minim.loadFile("slash.wav");
  victory = minim.loadFile("victory.mp3");
  //background = new SoundFile(this, "background.mp3");
  //ding = new SoundFile(this, "ding.mp3");
  //swoosh = new SoundFile(this, "swoosh.mp3");
  p1Base = new Base(100, height - 200, 100, 140, player1);
  p2Base = new Base(1125, 220, 100, 140, player2);
  redBird = new Fly(30, 100, 3);
  redDragon = new Fly((int) random (-700, -600), 60, 3);
  redFlag = loadImage("redflag.png");
  blueFlag = loadImage("blueflag.png");
  redFlag.resize(redFlag.width/2, redFlag.height/2);
  blueFlag.resize(blueFlag.width/2, blueFlag.height/2);
  redBase = loadImage("redbase.png");
  redBase.resize(redBase.width - 30, redBase.height - 30);
  blueBase = loadImage("bluebase.png");
  blueBase.resize(blueBase.width - 30, blueBase.height - 30);
  scoreScroll = loadImage("scroll.png");
  redFlag2 = loadImage("redflag.png");
  redFlag2.resize(redFlag.width - 40, redFlag.height - 40);
  blueFlag2 = loadImage("blueflag.png");
  blueFlag2.resize(blueFlag.width - 40, blueFlag.height - 40);
  town = loadImage("town.png");
  town.resize(town.width + 200, town.height + 200);
  welcome = loadImage("welcome.jpg");
  p1Wins = loadImage("redwins.png");
  p2Wins = loadImage("bluewins.png");
  p1Score = new Score(width/2 - 70, 110, 0, color(0));//#df6060));
  p2Score = new Score(width/2 + 70, 110, 0, color(0));//#6082dd));
  theBackground = loadImage("thebackground.png");
  theBackground.resize(theBackground.width + 200, theBackground.height + 200);
  
  
  for (int index = 0; index < 3; index ++){
    noBlueLeft[index] = loadImage("noblueleft" + index + ".png");
  }
  for (int index = 0; index < 3; index ++){
    noBlueRight[index] = loadImage("noblueright" + index + ".png");
  }
  for (int index = 0; index < 3; index ++){
    blueRight[index] = loadImage("blueright" + index + ".png");
  }
  for (int index = 0; index < 3; index ++){
    blueLeft[index] = loadImage("blueleft" + index + ".png");
  }
  for (int index = 0; index < 3; index ++){
    redLeft[index] = loadImage("noredleft" + index + ".png");
  }
  for (int index = 0; index < 3; index ++){
    redRight[index] = loadImage("noredright" + index + ".png");
  }
  for (int index = 0; index < 3; index ++){
    noRedRight[index] = loadImage("redright" + index + ".png");
  }
  for (int index = 0; index < 7; index ++){
    bird[index] = loadImage("flyingbird" + index + ".png");
  }
  for (int index = 0; index < 20; index ++){
    dragon[index] = loadImage("dragon" + index + ".png");
  }
  
  blueStanding = new Animation (blueRight, 0.1, 0.5);
  blueStanding2 = new Animation (blueLeft, 0.1, 0.5);
  blueAnimation2 = new Animation (noBlueRight, 0.1, 0.5);
  blueAnimation = new Animation (noBlueLeft, 0.1, 0.5);
  redAnimation = new Animation (redRight, 0.1, 0.5);
  redAnimation2 = new Animation (redLeft, 0.1, 0.5);
  redStanding = new Animation (noRedRight, 0.1, 0.5);
  birdFlying = new Animation (bird, 0.1, 0.08);
  dragonFlying = new Animation (dragon, 0.3, 0.3);
  }

void draw(){
  image(town, width/2, height/2);
  image(theBackground, width/2, height/2);
  
  //background(42);
  //p1Base.render();
  //p2Base.render();
  //player1.render();
  player1.move();
  player1.borders();
  //player2.render();
  player2.move();
  player2.borders();
  player1.collisions(player2.x, player2.y, player1.x, player1.y);
  //o1.render();
  o1.playerCollide(player1);
  o1.playerCollide(player2);
  //skyObstacle.render();
  skyObstacle.playerCollide(player1);
  skyObstacle.playerCollide(player2);
  image(scoreScroll, width/2, 100);
  p1Score.renderScore();
  p2Score.renderScore();
  //p1Flag.render();
  p1Flag.playerWithFlag(player2);
  //p2Flag.render();
  image(redFlag, p1Flag.x, p1Flag.y);
  image(blueFlag, p2Flag.x, p2Flag.y);
  //image(redFlag2, 30, 705);
  //image(redFlag2, 170, 705);
  //image(blueFlag2, 1125 - 70, 120);
  //image(blueFlag2, 1125 + 70, 120);
  image(redBase, p1Base.x - 10, p1Base.y + 35);
  image(blueBase, p2Base.x - 15, p2Base.y + 35);
  //redBird.render();
  redBird.move();
  redBird.reset();
  redDragon.move();
  redDragon.reset();
    
  if (background.isPlaying() == false){
    background.play();
    //victory.pause();
  }
  p1Flag.moveFlag(player2);
  p2Flag.moveFlag(player1);
  p1Base.playerSafe(p2Flag, p2Base, p1Score);
  p2Base.playerSafe(p1Flag, p1Base, p2Score);


  birdFlying.display(redBird.x, redBird.y);
  birdFlying.isAnimating = true;
  dragonFlying.display(redDragon.x, redDragon.y);
  dragonFlying.isAnimating = true;

  if (player2.isMovingRight == true){
    blueAnimation2.display(player2.x, player2.y - 10);
    blueAnimation2.isAnimating = true;
  }
  else if (player2.isMovingLeft == true || player2.isMovingUp == true || player2.isMovingDown == true){
    blueAnimation.display(player2.x, player2.y - 10);
    blueAnimation.isAnimating = true;
  }
  else {
    blueStanding2.display(player2.x, player2.y - 10);
    blueStanding2.isAnimating = true;
  }
  if (player1.isMovingLeft == true){
    redAnimation2.display(player1.x, player1.y - 10);
    redAnimation2.isAnimating = true;
  }
  else if (player1.isMovingRight == true || player1.isMovingUp == true || player1.isMovingDown == true){
    redAnimation.display(player1.x, player1.y - 10);
    redAnimation.isAnimating = true;
  }
  else {
    redStanding.display(player1.x, player1.y - 10);
    redStanding.isAnimating = true;
  }
  
   if (p2Flag.playerWithFlag(player1) && p1Flag.playerWithFlag(player2) && (player2.collisions(player1.x, player1.y, player2.x, player2.y)) && (player1.x > width/2)){
    player1.reset(player1, p2Flag, p2Base, p1Base);
  }
   if (p1Flag.playerWithFlag(player2) && (player2.collisions(player1.x, player1.y, player2.x, player2.y))){
    player1.reset(player2, p1Flag, p1Base, p2Base);
  }
  if (p2Flag.playerWithFlag(player1) && (player1.collisions(player1.x, player1.y, player2.x, player2.y))){
    player2.reset(player1, p2Flag, p2Base, p1Base);
  }
   if (!p1Flag.playerWithFlag(player2) && player2.x < width/2 && (player1.collisions(player1.x, player1.y, player2.x, player2.y))){
    player1.reset(player2, p1Flag, p1Base, p2Base);
  }
  
  if (!p2Flag.playerWithFlag(player1) && (player1.x > width/2 && (player2.collisions(player1.x, player1.y, player2.x, player2.y)))){
    player2.reset(player1, p2Flag, p2Base, p1Base);
  }
  if (p2Flag.playerWithFlag(player1) && p1Flag.playerWithFlag(player2) && (player2.collisions(player1.x, player1.y, player2.x, player2.y)) && (player2.x < width/2)){
    player2.reset(player2, p1Flag, p2Base, p1Base);
  }
  
    switch(state){
    // first case
    case 0:
    image(welcome, width/2, height/2);
    
    break;
    
    case 1:
    break;
    
    case 2:
    image(p1Wins, width/2, height/2);
    break;
    
    case 3:
    image(p2Wins, width/2, height/2);
    break;
  }
  if (key == 'p'){
    state = 1;
  }
  
  if (p1Score.score >= winningScore){
    state = 2;
    background.pause();
    slash.play();
    //victory.play();
  }
  if (p2Score.score >= winningScore){
    state = 3;
    background.pause();
    slash.play();
    //victory.play();
  }
  if (state == 2 || state == 3){
    victory.play();
    background.pause();
  }
  else {
    victory.pause();
  }
  if ((state == 3 || state == 2) && key == 'r'){
    state = 1;
    player1.reset(player1, p2Flag, p2Base, p1Base);
    player2.reset(player2, p1Flag, p2Base, p1Base);
    p1Score.reset();
    p2Score.reset();
  }
}



void keyPressed(){
    if (key == 'w'){
      player1.isMovingUp = true;
    }
    if (key == 'a'){
      player1.isMovingLeft = true;
    }
    if (key == 'd'){
      player1.isMovingRight = true;
    }
    if (key == 's'){
     player1.isMovingDown = true;
    }
    
    if (keyCode == UP){
      player2.isMovingUp = true;
    }
    if (keyCode == LEFT){
      player2.isMovingLeft = true;
    }
    if (keyCode == RIGHT){
      player2.isMovingRight = true;
      blueAnimation2.display(player2.x, player2.y);
    blueAnimation2.isAnimating = true;
    }
    if (keyCode == DOWN){
     player2.isMovingDown = true;
    }
}

void keyReleased(){
  
    if (key == 'w'){
      player1.isMovingUp = false;
    }
    if (key == 'a'){
      player1.isMovingLeft = false;
    }
    if (key == 'd'){
      player1.isMovingRight = false;
    }
    if (key == 's'){
     player1.isMovingDown = false;
    }
    if (keyCode == UP){
      player2.isMovingUp = false;
    }
    if (keyCode == LEFT){
      player2.isMovingLeft = false;
    }
    if (keyCode == RIGHT){
      player2.isMovingRight = false;
    }
    if (keyCode == DOWN){
     player2.isMovingDown = false;
    }
}
