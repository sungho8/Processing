size(400,400);
strokeCap(SQUARE);
strokeWeight(0);

fill(245);
quad(200,0,0,200,200,400,400,200);

fill(0);  //black line   a:height, b: Transverse

//weight = 8
strokeWeight(8);  

line(150,0,150,400);  //a
line(300,0,300,400);  //a

line(150,100,400,100);//b
line(150,230,400,230);//b
line(150,350,400,350);//b

//weight = 12
strokeWeight(12);

line(50,0,50,400);    //a
line(0,120,150,120);  //b

//weight = 10
strokeWeight(10);

line(0,300,150,300);


strokeWeight(0);

fill(255,0,0);  //red color
quad(0,0,147,0,147,115,0,115);  //red triangle

fill(0,0,255);  //blue color
quad(304,234,400,234,400,400,304,400);  //blue triangle

fill(255,255,0);  //yellow color
quad(0,305,146,305,146,400,0,400);  //yellow triangle

fill(0);  //black color
quad(150,350,400,350,400,400,150,400);  //black triangle


//background
fill(255);
triangle(0,0,0,200,200,0);
triangle(200,0,400,0,400,200);
triangle(400,200,400,400,200,400);
triangle(200,400,0,400,0,200);
