int xPos, yPos;
int xDir, yDir;
int padX, padWidth;
int [][]bricks = new int[2][10];
boolean dead, play;
 
void setup() {
  size(500, 400);
  GameReset();
}
 
void draw() {
  int i, j;
  background(255);
  for(i=0; i<2; i++) {
    for(j=0; j<10; j++) {
      if(bricks[i][j] == 1){
        fill(#1800FA);
        rect(j*50, i*20, 50, 20);
  }
  }
  }
  if(dead) {
    fill(#0A0A0A);
    text("Replay!", 50, height/3);
    if(mousePressed == true) GameReset();
  }
  if(play) {
    fill(#FA0000);
    ellipse(xPos, yPos, 20, 20);
    xPos += xDir;
    yPos += yDir;
    padX=mouseX;
    if(padX > 300) padX = 300;
    line(padX, height-75, padX+padWidth, height-75);
    if(xPos<10 || xPos>width-10) xDir *= -1;
    if(yPos<40) {
      if(bricks[yPos/20][xPos/50] == 1) {
        yDir *= -1;
        bricks[yPos/20][xPos/50]=0;
      }
      else if(yPos<0) yDir *= -1;
    } 
  }
  if(yPos>height-75 && xPos>=padX && xPos<=padX+padWidth) yDir *= -1;
  if(yPos>height-10) {
    dead=true;
    play=false;
  }
}
 
void GameReset() {
  int i, j;
  
  xPos = width/2;
  yPos = height/2;
  
  xDir=3;
  yDir=4;
  
  padX=width;
  padWidth=200;
  
  dead=false;
  play=true;
  
  for(i=0;i<2;i++) {
    for(j=0;j<10;j++) {
      bricks[i][j] = 1;
    }
  }
  
  strokeWeight(5);
  stroke(0);
}
