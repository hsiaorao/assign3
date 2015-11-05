//Image
PImage fighterImg,hpImg,treasureImg,enemyImg;
PImage bg1Img,bg2Img,start1Img;
PImage start2Img,end1Img,end2Img;

//int
int treasureX,treasureY,bgX;
int gameState;
final int GAME_START=1,GAME_RUN=2,GAME_END=3;
final int COUNT=5;

//float
float fighterX,fighterY,enemyX,enemyY;
float fighterSpeed=5;

//boolean
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

void setup () {
  size(640, 480) ;  
  gameState=GAME_START;
  
  //hp
  hpImg=loadImage("img/hp.png");

  //fighter
  fighterImg=loadImage("img/fighter.png");  
  fighterX=500;
  fighterY=240;

  //enemy
  enemyImg=loadImage("img/enemy.png");
  enemyX=0;
  enemyY=random(45,410);

  //background
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");  
  bgX=0;

  //start window
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png"); 

  //end window
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");

  //treasure
  treasureImg=loadImage("img/treasure.png");
  treasureX=floor(random(20,535));
  treasureY=floor(random(45,435));
}

void draw() {
    switch(gameState){
  //game start 
    case GAME_START:
    image(start2Img,0,0);
     if(mouseX>200 && mouseX<457 && mouseY >373 && mouseY<415){
      if(mousePressed){
        gameState=GAME_RUN;
     }
       else{
         image(start1Img,0,0);
       } 
     }
    break;
    
    case GAME_RUN:  
    
  //background
  image(bg1Img,bgX,0);
  image(bg2Img,bgX-640,0);
  image(bg1Img,bgX-1280,0);
  bgX+=1;
  bgX%=1280;  
  
  //fighter
  image(fighterImg,fighterX,fighterY);
  
  //hp
  rect(20,10,195,30);
  fill(255,0,0);
  image(hpImg,10,10); 
  
  //treasure
  image(treasureImg,treasureX,treasureY);
  if (fighterX>=treasureX-40 && treasureX+40>fighterX && fighterY>=treasureY-40 && fighterY<treasureY+40  )
  {
  treasureX=floor(random(20,535));
  treasureY=floor(random(45,435));
  image(treasureImg,treasureX,treasureY);
    }
  
  //enemy
    for (int i=0;i<COUNT;i++){
    image(enemyImg,enemyX+i*65-325,enemyY);
    }
    enemyX+=4;
    if(enemyX>=965){
        enemyY=random(45,415);
     }
     enemyX%=965;
     
  //move
  if(upPressed){
    fighterY-=fighterSpeed;
  }
  if(downPressed){
    fighterY+=fighterSpeed;
  }  
  if(leftPressed){
    fighterX-=fighterSpeed;
  }  
  if(rightPressed){
    fighterX+=fighterSpeed;
  }

  //boundary detection
    if(fighterX>590){
      fighterX=590;
    }
    if(fighterX<0){
      fighterX=0;
    }
    if(fighterY>430){
      fighterY=430;
    }
    if(fighterY<0){
      fighterY=0;
    }
    break;
    
    case GAME_END:
    image(end2Img,0,0);
     if(mouseX>200 && mouseX<457 && mouseY >373 && mouseY<415){
      if(mousePressed){
        gameState=GAME_RUN;
     }
       else{
         image(end1Img,0,0);
       } 
     }
    break;
    }
}
 

void keyPressed(){
  //move
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;  
      case RIGHT:
        rightPressed=true;
        break;  
    }
  }
}

void keyReleased(){
    if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=false;
        break;
      case DOWN:
        downPressed=false;
        break;
      case LEFT:
        leftPressed=false;
        break;  
      case RIGHT:
        rightPressed=false;
        break;  
    }
  }
}
