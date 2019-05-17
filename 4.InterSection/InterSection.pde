Car[] c;  
int tileCount;

int[] t;     //tile start point
int[][][] tile;  //tile [(18x18) ] x,y
boolean IsThereCar[][];

boolean greenLightY;
boolean greenLightX;

int tileSize;
int carSize;
int count = 0;  //car Count

void setup(){
  tileCount = 36;
  
  //Size
  size(900,900); 
  tileSize = width/3;
  carSize = tileSize/6 - 20;
  t = new int[10];
  tile = new int[tileCount][tileCount][2];
  IsThereCar = new boolean[tileCount][tileCount];  //true = there is car , false = there is not car
  
  frameRate(5);

  //Tile
  t[0] = 300;  t[1]= 0;      t[2] = 0;    t[3] = 300;
  t[4] = 300;  t[5] = 300;   t[6] = 600;  t[7] = 300;
  t[8] = 300;  t[9] = 600;
  
  
  for(int j = 0; j < tileCount; j++){    //x
    for(int k = 0; k < tileCount; k++){  //y
      if((j > 11 && j < 24) || (k > 11 && k<24)){
        tile[j][k][0] =  tileSize/12*j;     //i_tile[j,k] x
        tile[j][k][1] =  tileSize/12*k;  //i_tile[j,k] y
        
        
        rect(tile[j][k][0],tile[j][k][1],10,10);
      }else{
        tile[j][k][0] = 0;
        tile[j][k][1] = 0;
      }
    }
  }
  
  //Car
  c = new Car[72];  //Car Arr
  
  
  //up -> Down Car
  for(int i = 6; i < 9; i++){
    for(int j =0; j < 4; j++){
      
      c[count] = new Car('d',i*2,j*2);
      count++;
    }
  }
  
  //down -> Up Car
  for(int i = 9;i < 12; i++){
    for(int j = 12; j < 16; j++){
      c[count] = new Car('u',i * 2, j * 2 + 1);
      count++;
    }
  }
  
  //left -> Right Car
  for(int i = 0; i < 4; i++){
    for(int j = 6; j < 9; j++){
      c[count] = new Car('r', i * 2, j * 2);
      count++;
    }
  }
  
  //right -> Left Car
  for(int i = 12; i < 16; i++){
    for(int j = 9; j < 12; j++){
      c[count] = new Car('l', i * 2 + 1, j * 2);
      count++;
    }
  }
}

void draw(){
  stroke(1);
  //Tile
  background(200);
  
  
  //Line
  stroke(255);
  strokeWeight(5);
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 50; j+=2){
      line(350 + i * 50, j*30 ,350 + i * 50, (j+1) * 30);
    }
  }
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 50; j+=2){
      line( j*30 ,350 + i * 50, (j+1) * 30, 350 + i * 50);
    }
  }
  stroke(255,255,0);
  line(450,0,450,900);
  line(0,450,900,450);
  
  stroke(100);
  line(0,300,900,300);
  line(300,0,300,900);
  line(600,0,600,900);
  line(0,600,900,600);
  //fill(100);
  //rect(250,0,50,300);
  //rect(0,250,300,50);
  
  fill(200);  stroke(255);
  rect(300,300,300,300);
  
  //Traffic Check
  if(mouseX > 300 && mouseX < 600 && !(mouseY > 300 && mouseY < 600))
    greenLightY = true;
  else
    greenLightY = false;
  
  if(mouseY >300 && mouseY < 600 && !(mouseX > 300 && mouseX < 600))
    greenLightX = true;
  else
    greenLightX = false;
  
  //Traffic Sign
  noStroke();
  fill(255);
  rectMode(CENTER);
  if(greenLightY){
    rect(375,400,40,120);
    triangle(410,460,340,460,375,530);
    rect(525,470,40,120);
    triangle(560,410,490,410,525,340);
  }else if(greenLightX){
    rect(420,375,120,40);
    triangle(470,410,470,340,520,375);
    rect(470,525,120,40);
    triangle(420,560,420,490,370,525);
  }
  
  strokeWeight(0.3);
  //Move Car
  for(int i=0; i < count; i++){
    c[i].update();
  }
}

boolean CenterCheck(){  
  for(int i = 12; i < 24; i++){
    for(int j = 12; j < 24; j++){
      if(IsThereCar[i][j])
        return true;    //On the Intersection, There is a car
    }
  }
  return false;  //On the Intersection, There is not a car
}

void DrawCar(char dir,int xpos,int ypos){
  int x,y;
  if(dir == 'u' || dir == 'd'){
    
    x = tile[(int)xpos][(int)ypos][0] + 20;
    y = tile[(int)xpos][(int)ypos][1] + 10;
    
    //draw Car
    rectMode(CENTER);
    rect(x, y, carSize-5 , carSize+5); 
    
    fill(255);
    
    
    if(dir == 'd'){
      rect(x, y - 1, 15 , 20);
      rect(x + 7, y + carSize/2 - 1 ,7 ,5);
      rect(x - 7, y + carSize/2 - 1 ,7 ,5);
    }else if(dir == 'u'){
      rect(x, y + 1, 15 , 20);
      rect(x + 7, y - carSize/2 + 1 ,7 ,5);
      rect(x - 7, y - carSize/2 + 1 ,7 ,5);
    }
    
  }else if(dir =='r' || dir == 'l'){
    x = tile[(int)xpos][(int)ypos][0] + 10;
    y = tile[(int)xpos][(int)ypos][1] + 20;
    
    //draw Car
    rectMode(CENTER);
    rect(x, y, carSize+5 , carSize-5); 
    
    fill(255);
    
    
    if(dir == 'r'){
      rect(x-1 , y, 20 , 15);
      rect(x + carSize/2 - 1, y + 7 ,5 ,7);
      rect(x + carSize/2 - 1, y - 7 ,5 ,7);
    }else if(dir == 'l'){
      rect(x+1 , y, 20 , 15);
      rect(x - carSize/2 + 1, y + 7 ,5 ,7);
      rect(x - carSize/2 + 1, y - 7 ,5 ,7);
    }
  }
  
  
  
  rectMode(CORNER);
}


class Car { 
  char dir;
  int xpos,ypos; 
  float r,g,b;
  int checkPoint;
  //color col;
  Car (char d,int x, int y) {  
    dir = d;  // x is right and left / y is up and down
    xpos = x;
    ypos = y; 
    r = random(255); g = random(255); b = random(255);
    IsThereCar[xpos][ypos] = true;  
  } 
  void update() { 
    
      IsThereCar[xpos][ypos] = false;
      int s = (int)random(3);    //Random Speed
      boolean CanMove = true;    //Check that Car can move
      
     
      if(dir =='u' || dir == 'd')
        checkPoint = ypos;   
      else
        checkPoint = xpos;
      
      for(int i = 0; i < s * 2 + 1; i++){  //Check Bound = Speed * 2 + 1
        //1. Check on the next Tile that there is a car?
        switch(dir){
          case 'd':
            checkPoint = (checkPoint + 1) % tileCount;
            break;
          case 'u':
            if(checkPoint - 1 > 0)
              checkPoint = (checkPoint - 1) % tileCount;
            else
              checkPoint = tileCount-1;
            break;
          case 'r':
            checkPoint = (checkPoint + 1) % tileCount;
            break;
          case 'l':
            if(checkPoint - 1 > 0)
              checkPoint = (checkPoint - 1) % tileCount;
            else
              checkPoint = tileCount-1;
        }
        if((dir =='u' || dir =='d') && IsThereCar[xpos][checkPoint]){  //there is car
          CanMove = false;            //then car can't move
          break;
        }else if((dir =='r' || dir =='l') && IsThereCar[checkPoint][ypos]){
          CanMove = false;
          break;
        }
        
        
        //2. Check TrafficLight!
        if((dir =='u' || dir =='d')){
          if(!greenLightY && (checkPoint > 10 && checkPoint < 26)){
            //If your Car is on the intersection, You can move the car
            if(!(xpos > 11 && xpos < 25 && ypos > 11 && ypos < 25)){
              CanMove = false;
              break;
            }
          }
        }else if(dir =='r' || dir == 'l'){
          if(!greenLightX && (checkPoint > 10 && checkPoint < 26)){
            //If your Car is on the intersection, You can move the car
            if(!(xpos > 11 && xpos < 25 && ypos > 11 && ypos < 25)){
              CanMove = false;
              break;
            }
          }
        }
      }
      
      //3. Center Check!
      
      
      //Move the Car!
      if(CanMove){  
        switch(dir){
          case 'd':
            ypos = (ypos + s) % tileCount;  //if ypos > tileCount, ypos init(like Circle Queue)
            break;
          case 'u':
            if(ypos - s > 0)
              ypos = ypos - s;
            else
              ypos = tileCount - s -1 ;
            break;
          case 'r':
            xpos = (xpos + s) % tileCount;  //if xpos > tileCount, xpos init(like Circle Queue)
            break;
          case 'l':
            if(xpos - s > 0)
              xpos = xpos - s;
            else
              xpos = tileCount - s -1 ;
            break;
        }
      }
      fill(r,g,b);  //Random Color
      IsThereCar[xpos][ypos] = true;
      
      
      DrawCar(dir,xpos,ypos);
  }
}
