float sqrt3 = 1.7320508076;

//start time
int s;  
int m;
int h;

//current time
int hour;
int minute;
int second;

int size_hour1;
int size_hour2;
int size_min1;
int size_min2;
int size_sec1;
int size_sec2;

void setup(){
  size(1300,1000);
  time();
  size_hour1 = 550;
  size_hour2 = 440;
  size_min1  = 330;
  size_min2  = 220;
  size_sec1  = 110;
  size_sec2  = 50;
}

void Text(){
  fill(0);
  textSize(30);
  text("Color : ",30,40);
  fill(153,0,51);
  text("0",130,43);
  fill(255,102,102,200);
  text("0:",150,43);
  fill(80,180,20,200);
  text("0",180,43);
  fill(150,200,100,180);
  text("0:",200,43);
  fill(0,0,153,200);
  text("0",230,43);
  fill(51,51,255,200);
  text("0",250,43);
}

void time(){
  second = second();
  minute = minute();
  hour = hour();
}

//visual 0~9 clockNeadle on hexagon
void clockNeadle(int num,int r1){
  strokeWeight(20);
  strokeCap(ROUND);
  
  //color
  switch (r1){
    case 550:
      stroke(153,0,51);  //hour 1 color
      break;
    case 440:
      stroke(255,102,102,200);  //hour 2 color 
      break;
    case 330:
      stroke(80,180,20,200);  //min 1 color 
      break;
    case 220:
      stroke(150,200,100,180);  //min 2 color
      break;
    case 110:
      stroke(0,0,153,200);  //sec 1 color
      break;
    case 50:
      stroke(51,51,255,200);  //sec 2 color
  }
  
  
  //number
  switch (num){
    case 1:
      //3,4
      line(width/2-r1/2,height/2+(r1/2*sqrt3),width/2-r1,height/2);
      //4,5
      line(width/2-r1,height/2,width/2-r1/2,height/2-(r1/2*sqrt3));
      break;
    case 2:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2-(r1/2*sqrt3),width/2-r1/2,height/2-(r1/2*sqrt3));
      //4,5
      line(width/2-r1,height/2,width/2-r1/2,height/2+(r1/2*sqrt3));
      //5,6
      line(width/2-r1/2,height/2+(r1/2*sqrt3),width/2+r1/2,height/2+(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
      
    case 3:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2-(r1/2*sqrt3),width/2-r1/2,height/2-(r1/2*sqrt3));
      //5,6
      line(width/2-r1/2,height/2+(r1/2*sqrt3),width/2+r1/2,height/2+(r1/2*sqrt3));
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
      
    case 4:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //3,4
      line(width/2-r1/2,height/2-(r1/2*sqrt3),width/2-r1,height/2);
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
      
    case 5:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2+(r1/2*sqrt3),width/2-r1/2,height/2+(r1/2*sqrt3));
      //4,5
      line(width/2-r1,height/2,width/2-r1/2,height/2-(r1/2*sqrt3));
      //5,6
      line(width/2-r1/2,height/2-(r1/2*sqrt3),width/2+r1/2,height/2-(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
    case 6:
      //3,4
      line(width/2-r1/2,height/2-(r1/2*sqrt3),width/2-r1,height/2);
      //4,5
      line(width/2-r1,height/2,width/2-r1/2,height/2+(r1/2*sqrt3));
      //5,6
      line(width/2-r1/2,height/2+(r1/2*sqrt3),width/2+r1/2,height/2+(r1/2*sqrt3));
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
    case 7:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2-(r1/2*sqrt3),width/2-r1/2,height/2-(r1/2*sqrt3));
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      break;
    case 8:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2-(r1/2*sqrt3),width/2-r1/2,height/2-(r1/2*sqrt3));
      //3,4
      line(width/2-r1/2,height/2-(r1/2*sqrt3),width/2-r1,height/2);
      //4,5
      line(width/2-r1,height/2,width/2-r1/2,height/2+(r1/2*sqrt3));
      //5,6
      line(width/2-r1/2,height/2+(r1/2*sqrt3),width/2+r1/2,height/2+(r1/2*sqrt3));
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
    case 9:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2-(r1/2*sqrt3),width/2-r1/2,height/2-(r1/2*sqrt3));
      //3,4
      line(width/2-r1/2,height/2-(r1/2*sqrt3),width/2-r1,height/2);
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      //1,4
      line(width/2+r1,height/2,width/2-r1,height/2);
      break;
    case 0:
      //1,2
      line(width/2+r1,height/2,width/2+r1/2,height/2-(r1/2*sqrt3));
      //2,3
      line(width/2+r1/2,height/2-(r1/2*sqrt3),width/2-r1/2,height/2-(r1/2*sqrt3));
      //3,4
      line(width/2-r1/2,height/2-(r1/2*sqrt3),width/2-r1,height/2);
      //4,5
      line(width/2-r1,height/2,width/2-r1/2,height/2+(r1/2*sqrt3));
      //5,6
      line(width/2-r1/2,height/2+(r1/2*sqrt3),width/2+r1/2,height/2+(r1/2*sqrt3));
      //6,1
      line(width/2+r1,height/2,width/2+r1/2,height/2+(r1/2*sqrt3));
      break;
  }
  
  stroke(0);
}


void hexagon(int r1){
  strokeWeight(0.1);
  noFill();
  beginShape();
  vertex(width/2+r1,height/2);                 //1
  vertex(width/2+r1/2,height/2-(r1/2*sqrt3));  //2
  vertex(width/2-r1/2,height/2-(r1/2*sqrt3));  //3
  vertex(width/2-r1,height/2);                 //4
  vertex(width/2-r1/2,height/2+(r1/2*sqrt3));  //5
  vertex(width/2+r1/2,height/2+(r1/2*sqrt3));  //6
  endShape(CLOSE);
}

void draw(){
  time();
  background(255);
  hexagon(size_hour1);
  hexagon(size_hour2);
  hexagon(size_min1);
  hexagon(size_min2);
  hexagon(size_sec1);
  hexagon(size_sec2);
  clockNeadle(hour/10,size_hour1);
  clockNeadle(hour%10,size_hour2);
  clockNeadle(minute/10,size_min1);
  clockNeadle(minute%10,size_min2);
  clockNeadle(second/10,size_sec1);
  clockNeadle(second%10,size_sec2);
  
  Text();
}
