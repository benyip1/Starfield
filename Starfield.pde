PImage img;

class smoke {
  double pSize, pSpeed, pAngle, pX, pY, pDisplace;
  int pColor;
  smoke(){
    pX = (int)(Math.random()*25) + 240;
    pY = (int)(Math.random()*25) + 240;
    pSize = (int)(Math.random()*5) + 25;
    pSpeed = Math.random() + 0.5;
    pAngle = Math.random() * (Math.PI*2);
    pColor = color(152, 152, 152);
    pDisplace = (int)(Math.random()*5);
  }
   
  void move(){
    pX += (Math.cos(pAngle) * pSpeed);
    pY += (Math.sin(pAngle) * pSpeed);
    if(pX > 500 || pX < 0 || pY > 500 || pY < 0){
      pX = (int)(Math.random()*25) + 240;
      pY = (int)(Math.random()*25) + 240;
      pSpeed = Math.random() + 0.5;
    }  
  }
 
  void show(){
    noStroke();
    fill(pColor);
    ellipse((float)pX, (float)pY, (float)pSize, (float)pSize);
    ellipse((float)pX + (float)pDisplace + 5, (float)pY + (float)pDisplace + 5, (float)pSize, (float)pSize);
    ellipse((float)pX - (float)pDisplace + 5, (float)pY + (float)pDisplace + 5, (float)pSize, (float)pSize);
    ellipse((float)pX + (float)pDisplace + 5, (float)pY - (float)pDisplace + 5, (float)pSize, (float)pSize);
    ellipse((float)pX - (float)pDisplace + 5, (float)pY - (float)pDisplace + 5, (float)pSize, (float)pSize);
  }
}

class ash extends smoke{
  ash(){
    pX = (int)(Math.random()*25) + 240;
    pY = (int)(Math.random()*25) + 240;
    pSize = (int)(Math.random()*5) + 10;
    pSpeed = (int)(Math.random()*3) + 3;
    pAngle = Math.random() * (Math.PI*2);
    pColor = color(255, 151, 46);
    pDisplace = 0;
  }
  
  void move(){
    pX += (Math.cos(pAngle) * pSpeed) + (int)(Math.random()*5) - 3;
    pY += (Math.sin(pAngle) * pSpeed) + (int)(Math.random()*5) - 3;
    if(pX > 500 || pX < 0 || pY > 500 || pY < 0){
      pX = (int)(Math.random()*25) + 240;
      pY = (int)(Math.random()*25) + 240;
      pSpeed = (int)(Math.random()*3) + 3;
      pAngle = Math.random() * (Math.PI*2);
    }
  }
  
  void show(){
    noStroke();
    fill(pColor);
    ellipse((float)pX, (float)pY, (float)pSize, (float)pSize);
    fill(255, 151, 46, 30);
    ellipse((float)pX, (float)pY, (float)pSize + 25, (float)pSize + 25);
  }
}

smoke [] particles = new smoke[50];

void setup(){
  background(0);
  img = loadImage("fire-Picsart-BackgroundRemover.png");
  size(500, 500);
  for(int i = 0; i < particles.length - 5; i ++){
    particles[i] = new smoke();
  }
   for(int l = particles.length - 5; l < particles.length; l ++){
     particles[l] = new ash();
   }
}

void draw(){
  background(0);
  for(int i = 0; i < particles.length; i ++){
    particles[i].show();
    particles[i].move();
  }
  image(img, 175, 175, 150, 150);
}


