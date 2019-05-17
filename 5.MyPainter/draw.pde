size(580,1000);  //size
noStroke();
background(166,164,141);

color lowerBody=color(153,0,0);  //Red
color button = color(204,204,051);  //Yellow
color hair = color(0,35,0);  //Dark green
color skin = color(255,220,180);  // skin
color hat = color(0);
color hatPattern = color(230,230,51);
color hatPattern2 = color(150,0,0);
color eyebrow = color(204,102,000);


//Lower body(Red)
fill(lowerBody);
//Left Leg
ellipse(213,600,125,360);
quad(155,640,275,620,290,850,210,860);
quad(209,853,290,844,288,901,201,904);
//RightLeg
quad(207,476,324,442,437,907,360,936);



//Upper body(Black)
fill(0);
//Right elvo
ellipse(105,376,74,62);
quad(71,363,110,312,191,357,130,398);
quad(109,293,137,273,191,357,112,315);
triangle(137,273,189,359,198,261);

//Leftelvo
ellipse(356,345,46,126);

//Chest
triangle(360,286,326,265,195,265);
quad(175,461,195,265,360,282,354,461);
quad(253,241,246,273,358,282,314,249);
ellipse(264,461,178,36);

//button (yellow)
fill(button);
circle(239,457,12);
circle(241,433,12);
circle(246,404,12);
circle(250,376,12);
circle(255,355,12);
circle(261,334,11);
circle(274,282,12);

//neck button
quad(256,248,256,258,275,272,275,262);
quad(278,266,277,272,295,273,295,267);


//Hair
fill(hair);
ellipse(287,183,102,132);

//Head
fill(skin);
ellipse(290,204,86,120);

//Hair
fill(hair);
arc(291,204,89,122,PI,2*PI);

//face
fill(skin);
ellipse(312,204,52,60);
ellipse(284,209,75,58);





//hat
fill(hat);
quad(226,139,280,104,336,145,237,202);

beginShape();
vertex(250,85);
vertex(292,110);
vertex(295,129);
vertex(236,151);
vertex(238,110);
endShape();


//hatPattern 2 (red)
fill(hatPattern2);
beginShape();
vertex(236,137);
vertex(238,110);
vertex(250,85);
vertex(258,89);
vertex(255,109);
endShape(CLOSE);

beginShape();
vertex(259,90);
vertex(276,101);
vertex(286,123);
vertex(291,169);
vertex(268,144);
vertex(257,110);
endShape(CLOSE);

//hatPattern 1 (yellow)
fill(hatPattern);
ellipse(247,142,38,22);
ellipse(254,139,26,34);
quad(265,144,253,153,276,178,288,171);
quad(288,105,296,112,305,162,296,168);

ellipse(279,135,8,12);
beginShape();
vertex(268,111);
vertex(268,126);
vertex(275,129);
vertex(275,134);
vertex(280,131);
vertex(277,127);
vertex(277,120);
endShape();


//Face
//Eye(White)
fill(255);
stroke(0);
strokeWeight(0.2);
ellipse(272,206,18,10);
ellipse(313,209,16,10);

fill(0);
ellipse(273,205,8,8);
ellipse(314,208,8,8);

noStroke();

//Eyebrow
fill(eyebrow,160);
beginShape();  //left Eyebrow
vertex(300,211);
vertex(307,202);
vertex(311,198);
vertex(318,193);
vertex(315,193);
vertex(309,196);
vertex(305,201);
vertex(302,205);
vertex(300,209);
endShape();

beginShape();
vertex(287,206);
vertex(285,200);
vertex(282,195);
vertex(278,192);
vertex(271,192);
vertex(277,195);
vertex(285,205);
endShape();

//chick
fill(255,50,50,20);
ellipse(266,233,20,25);
ellipse(316,233,17,20);



//nose
fill(50,50);

beginShape();
vertex(285,222);
vertex(281,226);
vertex(281,231);
vertex(284,233);
vertex(290,233);
vertex(294,235);
vertex(302,232);
vertex(303,221);
vertex(302,222);
vertex(302,231);
vertex(300,230);
vertex(295,231);
vertex(294,232);
vertex(290,231);
vertex(287,229);
vertex(284,230);
vertex(284,231);
vertex(282,230);
vertex(282,226);
vertex(285,223);
endShape();

//mouse
fill(140,0,0,140);
beginShape();
vertex(279,245);
vertex(284,242);
vertex(289,243);
vertex(293,244);
vertex(296,243);
vertex(306,245);
vertex(298,248);
vertex(291,248);
vertex(285,247);
endShape();

//ear Right
fill(skin);
ellipse(236,208,18,28);
ellipse(246,220,22,24);
triangle(229,216,237,227,238,217);

//ear Left
quad(337,199,342,204,324,243,331,219);
ellipse(340,202,6,16);

//ear Right
fill(eyebrow,100);
beginShape();
vertex(236,207);
vertex(242,206);
vertex(244,210);
vertex(240,210);
vertex(240,215);
vertex(237,214);
endShape();

beginShape();
vertex(232,200);
vertex(237,199);
vertex(242,203);
vertex(242,205);
vertex(238,202);
vertex(234,202);
vertex(231,207);
vertex(230,204);
endShape();

beginShape();
vertex(234,213);
vertex(234,215);
vertex(243,222);
vertex(243,220);
vertex(247,222);
vertex(245,217);
vertex(242,217);
vertex(240,219);
endShape();

//ear left
beginShape();
vertex(340,200);
vertex(342,201);
vertex(337,213);
vertex(336,209);
vertex(337,202);
endShape();

//right hand
fill(skin);
beginShape();
vertex(121,310);
vertex(129,299);
vertex(131,255);
vertex(135,252);
vertex(139,252);
vertex(141,253);
vertex(145,249);
vertex(149,249);
vertex(153,254);
vertex(164,236);
vertex(170,236);
vertex(172,239);
vertex(172,245);
vertex(170,246);
vertex(169,256);
vertex(173,256);
vertex(176,251);
vertex(184,249);
vertex(190,255);
vertex(192,267);
vertex(193,271);
vertex(179,280);
vertex(180,282);
vertex(173,295);
vertex(158,304);
endShape();

//white muffler
//left
fill(255);
beginShape();
vertex(193,261);
vertex(182,312);
vertex(182,334);
vertex(194,422);
vertex(214,496);
vertex(238,515);
vertex(260,517);
vertex(267,512);
vertex(261,502);
vertex(259,501);
vertex(259,491);
vertex(250,485);
vertex(241,485);
vertex(232,480);
vertex(220,461);
vertex(217,412);
vertex(208,382);
vertex(212,359);
vertex(224,323);
vertex(225,277);
vertex(224,265);
endShape();

//right
beginShape();
vertex(273,489);
vertex(281,481);
vertex(281,475);
vertex(342,412);
vertex(342,450);
vertex(345,448);
vertex(345,457);
vertex(341 ,461);
vertex(341,464);
vertex(320,488);
vertex(300,492);
vertex(280,503);
endShape();

//yellow ring
noFill();
stroke(255,255,0);
strokeWeight(5);
circle(269,500,20);
noStroke();



//pi ri
fill(0);
quad(114,263,114,274,334,257,334,245);
ellipse(114,268,6,10);
ellipse(334,251,6,10);

fill(70);
quad(153,263,154,265,327,253,327,251);

fill(200);
quad(327,245,329,258,332,257,331,245);

//Left Hand
fill(skin);
beginShape();
vertex(231,304);
vertex(258,285);
vertex(258,278);
vertex(244,247);
vertex(232,243);
vertex(229,245);
vertex(219,246);
vertex(212,253);
vertex(221,254);
vertex(229,263);
vertex(225,263);
vertex(210,253);
vertex(197,253);
vertex(193,256);
vertex(200,259);
vertex(218,271);
vertex(204,269);
vertex(200,272);
vertex(200,276);
vertex(206,277);
vertex(214,281);
vertex(219,287);
vertex(224,295);
endShape();


//instrumen (yellow)
fill(button);
quad(156,323,179,323,232,561,209,561);
ellipse(221,561,24,10);
ellipse(167,323,24,10);
quad(191,383,210,461,216,429,201,377);


//socks
//left socks
fill(255);
beginShape();
vertex(189,916);
vertex(197,907);
vertex(197,904);
vertex(204,898);
vertex(218,895);
vertex(234,896);
vertex(259,901);
vertex(277,900);
vertex(286,897);
vertex(288,901);
vertex(278,913);
vertex(239,927);
endShape();


//right shoes
fill(0);
ellipse(451,965,74,24);
quad(394,943,450,929,488,963,415,967);

//right socks
fill(255);
beginShape();
vertex(373,932);
vertex(411,907);
vertex(431,907);
vertex(447,920);
vertex(450,925);
vertex(450,929);
vertex(456,934);
vertex(456,936);
vertex(439,934);
vertex(430,936);
vertex(423,936);
vertex(412,949);
vertex(383,945);
endShape();



//left shoes
fill(0);
ellipse(198,941,64,20);
beginShape();
vertex(167,941);
vertex(168,935);
vertex(192,915);
vertex(223,916);
vertex(234,922);
vertex(245,921);
vertex(285,903);
vertex(287,896);
vertex(290,893);
vertex(296,900);
vertex(283,915);
vertex(270,924);
vertex(256,925);
vertex(230,943);
endShape();
