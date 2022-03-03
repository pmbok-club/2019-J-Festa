PImage img;

final int PMAX = 1024;
final int NML  = 0;
final int HF   = 1;

boolean isImg = true;

float rad = 0;

Torus inner;
Torus outer;

float xzrad = 500.0;
float ydist = 200.0;
float[] light1 = {xzrad * cos(0),       -ydist, xzrad * sin(0)};
float[] light2 = {xzrad * cos(PI*2/3),  -ydist, xzrad * sin(PI*2/3)};
float[] light3 = {xzrad * cos(-PI*2/3), -ydist, xzrad * sin(-PI*2/3)};

color skyblue = #00A0E9;
color yellow  = #FFF100;
color magenta = #E5005A;

void setup() {
  size(960, 540, P3D);
  frameRate(30);
  smooth();
  
  img = loadImage("./data/slide.png");
  
  camera(width/2 - 300, height/2, 0,
         width/2, height/2, 0,
         0, 1, 0);
  
  inner = new Torus(32, 32,  50.0, 100.0, NML, 8);
  outer = new Torus( 8,  8, 100.0, 150.0,  HF, 2);
}

void draw() {
  background(255);
  
  translate(width/2, height/2, 0);
  
  // light
  pushMatrix();
  rotateY(rad*10);
  rotateZ(rad*9);
  pointLight(red(yellow),  green(yellow),  blue(yellow),  light1[0], light1[1], light1[2]);
  pointLight(red(skyblue), green(skyblue), blue(skyblue), light2[0], light2[1], light2[2]);
  pointLight(red(magenta), green(magenta), blue(magenta), light3[0], light3[1], light3[2]);
  directionalLight(255, 255, 255, 0, -1, 0);
  popMatrix();
  
  shininess(5.0);
  
  // inner torus
  pushMatrix();
  rotateX(sin(-rad*3));
  rotateY(rad*6);
  rotateZ(cos(-rad));
  noFill();
  stroke(150);
  inner.drawBone(16);
  fill(255);
  inner.drawSphere(5.0, 2.0);
  inner.drawLines();
  popMatrix();
  
  // outer torus
  pushMatrix();
  rotateX(map(cos(rad* 5), -1, 1, -PI/8, PI/8));
  rotateY(-rad);
  rotateZ(map(sin(rad*10), -1, 1, -PI/6, PI/6));
  noFill();
  stroke(200);
  outer.drawBone(8);
  fill(255);
  outer.drawSphere(18.0, 5.0);
  popMatrix();
  
  // show image
  if (isImg) {
    pushMatrix();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    imageMode(CENTER);
    rotateY(-HALF_PI);
    scale(0.325);
    image(img, 0, 0);
    hint(ENABLE_DEPTH_TEST);
    popMatrix();
  }
  
  
  rad += 0.001;
}

void keyPressed() {
 if (keyCode == 'P') {
    String name = "./img/img" + str(month()) + "-" + str(day()) + "-" 
                  + str(hour()) + "-" + str(minute()) + "-"+ str(second()) + ".png";
    save(name);
    println("saved:",  name);
  } else if (keyCode == '1') {
    if (isImg) isImg = false;
    else isImg = true;;
  }
}
