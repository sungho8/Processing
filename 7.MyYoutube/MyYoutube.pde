import processing.video.*; // load library
Movie myMovie; // Declare Movie type variable
float moviePos = 0;
boolean IsPlay = true;
float speed = 1.0;
int image_num;
PImage img;


void setup() {
  size(1280,720,P3D); 
  myMovie = new Movie(this, "1.mp4"); 
  myMovie.play(); // play the video 
  myMovie.loop();
}

void draw() {
  image(myMovie, 0, 0);
  myMovie.speed(speed);
  
  //GrayLine : line to background
  stroke(200);
  strokeWeight(10);
  line(0, height-50, width, height-50);
  
  //WhiteLine : line to show jump
  stroke(255);
  line(0, height-50, mouseX, height-50); 
  
  //RedLine : line to show time
  stroke(255,0,0);
  line(0, height-50, myMovie.time() / myMovie.duration() * width, height-50);
  //RedCircle : show time
  circle(myMovie.time() / myMovie.duration() * width, height-50,5);
  
  //하단바
  fill(100,100);
  noStroke();
  rect(0,height-50,width,height-50);
  
  
  if(IsPlay){
    puaseImage();//재생중이면 일시정지 아이콘 출력
  }else{
    playImage();
  }
  speedImage();
  printTime();
  
  //하단바 영역 마우스
  if(mouseY >= height-60 && mouseY < height-40){
     image_num = (int)(mouseX/(width/myMovie.duration())/4);
     img = loadImage(image_num + ".JPG");
     fill(255);
     rect(mouseX-82,mouseY-102,164,98);
     image(img,mouseX-80,mouseY-100,160,94);
  }
}

void mousePressed() {
  // 동영상 영역 클릭시 재생, 일시정지
  if(mouseY < height-60 || (mouseX < 48 && mouseY >= height-60)){
    if(IsPlay){
      IsPlay = false;
      myMovie.pause();
    }
    else{
      IsPlay = true;
      myMovie.play();
    }
  } //하단바 클릭시 해당위치로 점프
  else if(mouseY >= height-60 && mouseY < height-40){
    moviePos = mouseX/(width/myMovie.duration());  //이동할 영상의 위치.
    println(moviePos);
    myMovie.jump(moviePos);
    
  }//속도조절 영역 클릭시
  else if(mouseY >= height-40){
    if(mouseX >=700 && mouseX<740){  //0.25
      println("0.25");
      speed = 0.25;
    }else if(mouseX >=740 && mouseX<780){
      println("0.5");
      speed = 0.5;
    }else if(mouseX >=780 && mouseX<820){
      println("0.75");
      speed = 0.75;
    }else if(mouseX >=820 && mouseX<860){
      println("1.0");
      speed = 1.0;
    }else if(mouseX >=860 && mouseX<900){
      println("1.25");
      speed = 1.25;
    }else if(mouseX >=900 && mouseX<940){
      println("1.5");
      speed = 1.5;
    }else if(mouseX >=940 && mouseX<980){
      println("1.75");
      speed = 1.75;
    }else if(mouseX >=980 && mouseX<1020){
      println("2.0");
      speed = 2.0;
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}

//재생 시간
void printTime(){
  text((int)myMovie.time(),100,height-20);
  text(" / "+(int)myMovie.duration(),130,height-20);
}

void playImage(){
  noStroke();
  fill(255);
  
  triangle(10,height-10,10,height-30,30,height-20);
}

void puaseImage(){
  noStroke();
  fill(255);
  rect(10,height-30,7,20);
  rect(20,height-30,7,20);
}

void speedImage(){
  text("Set Speed",600,height-20);
  text("0.25",700,height-20);
  text("0.5",740,height-20);
  text("0.75",780,height-20);
  text("1.0",820,height-20);
  text("1.25",860,height-20);
  text("1.5",900,height-20);
  text("1.75",940,height-20);
  text("2.0",980,height-20);
}
