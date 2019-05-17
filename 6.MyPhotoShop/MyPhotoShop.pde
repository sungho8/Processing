import controlP5.*;

ControlP5 cp5;
DropdownList d1;
PImage img;

String effect = "";

boolean IsThereImage = false;
boolean drag = false;

boolean Mosaic = false;
boolean Inverse  = false;
boolean Blur = false; 
boolean Red = false;
boolean Green = false;
boolean Blue = false;
boolean Hue = false;
boolean Desaturation = false;

Textarea command;

int clickX=0;
int clickY=0;
int releaseX = 0;
int releaseY = 0;

void setup() {
  PFont font = createFont("arial",20);
  size(1600,800);
  noStroke();
  
  //GUI
  cp5 = new ControlP5(this);
  
  //불러올 이미지 입력하는 텍스트필드
  cp5.addTextfield("Image")
     .setSize(200,60)
     .setPosition(0,20)
     .setFont(font)
     .setAutoClear(false);
  
  //이미지 불러오는 버튼
  cp5.addButton("OpenImage")
     .setPosition(205,20)
     .setSize(150,60)  
     .setFont(font)
     ;
  cp5.addButton("Mosaic")
     .setPosition(0,120)
     .setSize(150,60)
     .setFont(font)
     ;
  cp5.addButton("Inverse")
     .setPosition(0,180)
     .setSize(150,60)
     .setFont(font)
     ;
  cp5.addButton("Blur")
     .setPosition(0,240)
     .setSize(150,60)
     .setFont(font)
     ;
  cp5.addButton("Red")
     .setPosition(0,300)
     .setSize(150,60)
     .setFont(font)
     ;
   cp5.addButton("Green")
     .setPosition(0,360)
     .setSize(150,60)
     .setFont(font)
     ;
   cp5.addButton("Blue")
     .setPosition(0,420)
     .setSize(150,60)
     .setFont(font)
     ;
  cp5.addButton("Hue")
     .setPosition(0,480)
     .setSize(150,60)
     .setFont(font)
     ;
  cp5.addButton("Desaturation")
     .setPosition(0,540)
     .setSize(150,60)
     .setFont(createFont("arial",16))
     ;
  cp5.addButton("Clear")
     .setPosition(1250,40)
     .setSize(150,60)
     .setFont(font)
     ;
  cp5.addButton("SaveImage")
     .setPosition(1250,730)
     .setSize(150,60)
     .setFont(font)
     ;
     
//설명을 돕는 텍스트영역
  command = cp5.addTextarea("txt")
     .setPosition(200,730)
     .setSize(240,40)
     .setFont(createFont("arial",20))
     .setLineHeight(14)
     .setColor(color(128))
     .setColorBackground(color(255,100))
     .setColorForeground(color(255,100));
  command.setText("Set Image..");



  Clear();
}

void draw() {
  setText();
}

// 버튼이 클릭되고 있는지 체크
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  if(IsThereImage){
    command.setText(theEvent.getController().getName());
    if(theEvent.getController().getName() != "OpenImage")
      effect = theEvent.getController().getName();
  }else{
    command.setText("Set Image");
  }
}

void OpenImage(){
   try{
     Clear();
     //텍스트 필드에 입력된 이미지를 화면에 보인다.
     img = loadImage(cp5.get(Textfield.class,"Image").getText() + ".jpg");
     imageMode(CENTER);
     image(img,width/2,height/2,img.width,img.height);
     IsThereImage = true;
     throw new Exception();
   }catch(Exception e){
     e.printStackTrace();
     println("이미지를 찾을수 없습니다.");
   }
}


void setFalse(){
  Mosaic = false;
  Inverse = false;
  Blur = false;
  Red = false;
  Blue = false;
  Green = false;
  Hue = false;
  Desaturation = false;
}

void setText(){
  
  rectMode(CORNER);
  fill(0,0,80);
  rect(360,20,800,60);
  rectMode(CENTER);
  
  textSize(20);
  fill(255);
  if(IsThereImage){
    text("Image Name : " + cp5.get(Textfield.class,"Image").getText(),365,40);
    text("Image Size : " + img.width + "x" +img.height,365,70);
    text("Effect : "+effect,700,40);
  }
  
  
}

void Mosaic(){
  setFalse();
  Mosaic = true;
  
  int pixelSize = 10;
  
  for(int x = - img.width / 2; x < img.width / 2 ; x += pixelSize){
    for(int y = - img.height / 2; y < img.height / 2 ; y += pixelSize) {
      color c = img.get(x + img.width / 2, y + img.height/2);
      c = color(red(c),green(c),blue(c));
      fill(c);
      
      if(drag){
        //드래그한 영역이라면 그 영역만 효과 처리
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          rect(pixelSize/2 + x + width/2, pixelSize/2 + y + height/2, pixelSize, pixelSize);
        }
      }else{
        rect(pixelSize/2 + x + width/2, pixelSize/2 + y + height/2, pixelSize, pixelSize);
      }
      
    }
  }
}

void Inverse(){
  setFalse();
  Inverse = true;
  //Clear();
  
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      color c = img.get(x + img.width / 2, y + img.height/2);
      c = color(255-red(c),255-green(c),255-blue(c));
      
      if(drag){
        //드래그한 영역이라면 그 영역만 효과 처리
        if( clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          set(x + width/2, y + height/2,c);
        }
      }else{
        set(x + width/2, y + height/2,c);
      }
    }
  }
}

//블러효과(9x9의 평균값).
void Blur(){
  setFalse();
  Blur = true;
  
  int blurSize = 9;
  float sumR = 0, sumG = 0, sumB = 0;
  
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      for(int xx = 0;xx < blurSize; xx ++){  //b*b크기의 블러
        for(int yy = 0;yy < blurSize; yy ++){
           color c = img.get(x + img.width / 2 + xx, y + img.height/2 + yy);
           sumR += (int)red(c);
           sumG += (int)green(c);
           sumB += (int)blue(c);
        }
      }
      sumR /= blurSize*blurSize;
      sumG /= blurSize*blurSize;
      sumB /= blurSize*blurSize;
      color sum = color(sumR,sumG,sumB);
      
      
      //드래그한 영역이라면 그 영역만 효과 처리
      if(drag){
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          set(x + width/2, y + height/2,sum);
        }
      }else{
        set(x + width/2, y + height/2,sum);
      }
      
    }
  }
}

void Red(){
  setFalse();
  Red = true;
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      color c = img.get(x + img.width / 2, y + img.height/2);
      
      //드래그한 영역이라면 그 영역만 효과 처리
      if(drag){
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          set(x + width/2, y + height/2,color(red(c),0,0));
        }
      }else{
        set(x + width/2, y + height/2,color(red(c),0,0));
      }
      
    }
  }
}

void Blue(){
  setFalse();
  Blue = true;
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      color c = img.get(x + img.width / 2, y + img.height/2);
      //드래그한 영역이라면 그 영역만 효과 처리
      if(drag){
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          set(x + width/2, y + height/2,color(0,0,blue(c)));
        }
      }else{
        set(x + width/2, y + height/2,color(0,0,blue(c)));
      }
      
    }
  }
}

void Green(){
  setFalse();
  Green = true;
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      color c = img.get(x + img.width / 2, y + img.height/2);
      
      //드래그한 영역이라면 그 영역만 효과 처리
      if(drag){
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          set(x + width/2, y + height/2,color(0,green(c),0));
        }
      }else{
        set(x + width/2, y + height/2,color(0,green(c),0));
      }
      
    }
  }
}

void Hue(){
  setFalse();
  color c;
  Hue = true;
  colorMode(HSB);
  
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      c = img.get(x + img.width / 2, y + img.height/2);
      c = color((hue(c)+128)%256,saturation(c),brightness(c));
      //드래그한 영역이라면 그 영역만 효과 처리
      if(drag){
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){
          set(x + width/2, y + height/2,c);
        }
      }else{
        set(x + width/2, y + height/2,c);
      }
    }
  }
  colorMode(RGB);
}

void Desaturation(){
  setFalse();
  color c;
  Desaturation = true;
  colorMode(HSB);
  
  for(int x = -img.width/2; x < img.width/2; x++){
    for(int y = -img.height/2; y < img.height/2; y++) {
      c = img.get(x + img.width / 2, y + img.height/2);
      c = color(hue(c),0,brightness(c));
      //드래그한 영역이라면 그 영역만 효과 처리
      if(drag){
        if(clickX < x + width/2 && clickY < y + height/2 && releaseX > x + width/2 && releaseY > y + height/2){  
          set(x + width/2, y + height/2,c);
        }
      }else{
        set(x + width/2, y + height/2,c);
      }
    }
  }
  
  colorMode(RGB);
}

void Clear(){
    rectMode(CENTER);
    fill(255);
    rect(width/2,height/2,width-400,height-200);
}


//클릭했을때 좌표
void mousePressed() {
  if (mouseButton == LEFT) {
    println(mouseX+", "+mouseY);
    clickX = mouseX;
    clickY = mouseY;
  }
}

//마우스 드래그할때 좌표
void mouseDragged(){
  if(mouseX>200&&mouseX<1400&&mouseY>100&&mouseY<700 ){
    Clear();
    if(IsThereImage)
      image(img,width/2,height/2,img.width,img.height);
    
    rectMode(CORNER);
    fill(230,200);
    stroke(0);
    strokeWeight(1);
    
    rect(clickX,clickY,mouseX-clickX,mouseY-clickY);
    noStroke();
  }
}

//마우스 놓았을때 좌표
void mouseReleased(){
  int temp = 0;
  
  //영역내에서만 드래그 가능
  if(mouseX>200&&mouseX<1400&&mouseY>100&&mouseY<700 ){
    Clear();
    if(IsThereImage)
      image(img,width/2,height/2,img.width,img.height);
      
    println(mouseY+","+mouseY);
    releaseX = mouseX;
    releaseY = mouseY;
  }
  
  //오른쪽아래 > 왼쪽위로 드래그 했을경우.
  if(clickX > releaseX){
    temp = clickX;
    clickX = releaseX;
    releaseX = temp;
  }
  if(clickY > releaseY){
    temp = clickY;
    clickY = releaseY;
    releaseY = temp;
  }
    
  //현재 이펙트를 드래그한영역에 적용
  drag = true;
  if(Mosaic == true){
    Mosaic();
  }else if(Inverse == true){
    Inverse();
  }else if(Blur == true){
    Blur(); 
  }else if(Red == true){
    Red(); 
  }else if(Blue == true){
    Blue(); 
  }else if(Green == true){
    Green(); 
  }else if(Hue == true){
    Hue();
  }else if(Desaturation == true){
    Desaturation();
  }
  
  drag = false;
}

void SaveImage(){
  save("mydraw.jpg");
  
}
