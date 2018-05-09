
float min = -2.5;
float max = 2.5;
float iterations = 75;
float xOff = 10;
float yOff = 10;
float keyBoardXOff = 0;
float keyBoardYOff = 0;
float _width = 0;
float _height = 0;

void setup(){
  size(480,480);
  loadPixels();
  for(int x = 0; x<width; x++){
    for(int y = 0; y<height; y++){
      color c = color(0);
      set(x,y,c);
    }
  }
  _width = width;
  _height = height;
}

void draw(){
  loadPixels();
    
  //min*=0.99;
  //max*=0.99;
    
  //float mouse_x = (mouseX*2-width);
  //float mouse_y = (mouseY*2-height);  
    
  //xOff = (1*((width/_width)))*(1/min)+keyBoardXOff;
  //yOff = (1*((height/_height)))*(1/min)+keyBoardYOff;
  
  xOff = (min)+keyBoardXOff;
  yOff = (max)+keyBoardYOff;
  
  //Off = width/2-72*(1/max);
  //yOff = width/2-117*(1/max);
 
  for(int x = 0; x<width; x++){
    for(int y = 0; y<height; y++){
      
      //float initialA = map(x,mouseX,width,map(mouseX,0,width,-1,0),map(mouseY,0,height,0,1));
      //float initialB = map(y,mouseY,height,map(mouseX,0,width,-1,0),map(mouseY,0,height,0,1));
      
      float initialA = map(x,xOff,width+xOff,min,max);
      float initialB = map(y,yOff,height+yOff,min,max);
      
      float a = initialA;
      float b = initialB;
      
      int i = 0;
      for(i = 0; i<iterations; i++){
        float tempA = a*a - b*b;
        float tempB = 2*a*b;
        
        a = initialA + tempA;
        b = initialB + tempB;
        
        if(sqrt(a*a + b*b)>2){
          break;
        }
      }
      
      int col = floor(map(i,0,iterations,180,360));
      if(i==iterations){
        col = 180;
      }
      
      //println(col);
      colorMode(HSB);
      color colour = color(360-col,100,100);
      
      set(x,y, colour);
    }
  }
  
  //println(minX);
  //println(frameRate);
  //saveFrame("mandelbrot_Set-frame-###############.png");
  //updatePixels();
  //noLoop();
  
  //println(mouseX+"|"+mouseY);
}

void mouseWheel(MouseEvent event){
  float e = event.getCount();
  if(e<0){
    min*=0.9;
    _width*=0.9;
    max*=0.9;
    _height*=0.9;
  }else{
    min*=1.1;
    max*=1.1;
    _width*=1.1;
    _height*=1.1;  
}
}

void keyPressed(){
  if(keyCode == 37){ // L
    keyBoardXOff += (max/max) *3;
  }else if(keyCode == 38){ // U
    keyBoardYOff += (max/max) *3;
  }else if(keyCode == 39){ // R
    keyBoardXOff -= (max/max) *3;
  }else if(keyCode == 40){ // D
    keyBoardYOff -= (max/max) *3;
  }
  if(keyCode == 93){
    min*=0.9;
    _width*=0.9;
    max*=0.9;
    _height*=0.9;
    keyBoardXOff*=1.1;
    keyBoardYOff*=1.1;
  }else if(keyCode == 91){
    min*=1.1;
    max*=1.1;
    keyBoardXOff*=0.9;
    keyBoardYOff*=0.9;
  }
  println(keyCode);
}
