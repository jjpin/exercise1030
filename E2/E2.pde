PImage sun;
PImage earth;
PImage moon;
float phi = 0;

void setup (){
  size(600,600);
  sun = loadImage("sun.png");
  earth = loadImage("earth.png");
  moon = loadImage("moon.png");
}

void draw(){
  background(0);
  imageMode(CENTER);
  image(sun, 300, 300);
  
  //earth
  pushMatrix();
  translate(300, 300);
  float earthX = map(mouseX, 0, width, -PI, PI);
  float earthY = map(mouseX, 0, width, -PI, PI);
  rotate(earthX);
  rotate(earthY);
  image(earth, 150+earthX, 150+earthY);
  
  //moon
  float ix=25, iy=25;
  float angle = 0; 
  float size = 20*5/3;
  translate(150+earthX, 150+earthY);
  for(int i=0; i<1; i++){
    for(int j=0; j<1; j++){
      float x = ix+i*20;
      float y = iy+j*20;
      angle += 0.66;
      float moonX = x+cos(angle+phi)*size/2;
      float moonY = y+sin(angle+phi)*size/2;
      rotate(moonX);
      rotate(moonY);
      phi+=0.005;
      println(phi);
      image(moon, moonX, moonY);
    }
  }
  popMatrix();
}
