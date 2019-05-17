color[] c = new color[25];
int iteration = 0;
int size=50;

void setup(){
  size(1000,1000);
  float r,g,b;
  
  //random color
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      r = random(255);
      g = random(150);
      b = random(100);
      c[5*i+j] = color(r,g,b);
    }
  }
  noStroke();
  
  pattern1(0,0);
  iteration = 0;
  pattern2(0,0);
  iteration = 0;
  pattern1(25,25);
  iteration = 0;
  pattern2(25,25);
  iteration = 0;
  pattern3(0,0);
  iteration = 0;
  pattern4(0,0);
}

void drawTriangle(int x,int y){
  triangle(x,y,x,y+10,x+10,y+10);
}

//under triangle
void pattern1(int x,int y){
  iteration++;
  float random = random(25);
  
  fill(c[(int)random],250);
  triangle(x,y,x,y+size,x+size,y+size);
  
  if(x/size < width/size)
    pattern1(x+size,y);
  else if(y/size < height/size)
    pattern1(0,y+size);
  else
    return;
}

//upper triangle
void pattern2(int x,int y){
  iteration++;
  float random = random(25);
  
  fill(c[(int)random],200);
  triangle(x,y,x+size,y,x+size,y+size);
  
  if(x/size < width/size)
    pattern2(x+size,y);
  else if(y/size < height/size)
    pattern2(0,y+size);
  else
    return;
}

//circle
void pattern3(int x,int y){
  iteration++;
  float random = random(25);
  
  stroke(random*10);
  strokeWeight(0.1);
  fill(30,50);
  circle(x,y,10*random);
  
  if(x/size < width/size)
    pattern3(x+size*2,y);
  else if(y/size < height/size)
    pattern3(0,y+size*2);
  else
    return;
}

//rect
void pattern4(int x,int y){
  iteration++;
  float random = random(25);
  
  stroke(random*10);
  strokeWeight(0.1);
  fill(255,50);
  rect(x,y,random*5,random*5);
  
  if(x/size < width/size)
    pattern4(x+size*2,y);
  else if(y/size < height/size)
    pattern4(0,y+size*2);
  else
    return;
}
