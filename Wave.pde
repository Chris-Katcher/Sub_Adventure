class Wave {
  PShape wave;
  color waveColor;
  float t;
 Wave(color waveColor)
 { //<>//
   //create a perlin noise shape to simulate moving waves
    float t = 0;
    t = t+10;
    float y = noise(t);
    y = map(y,0,1,0,100);
    this.waveColor = waveColor;
    wave = createShape();
    wave.beginShape();
    wave.noStroke();
    wave.vertex(0,1200);
    
    for(int i = 0; i < 1000; i++)
    { //<>//
     wave.vertex(i,y);
     t = t+.01;
     y = noise(t+10);
     y = map(y,0,1,0,50);
    }
    wave.vertex(1000, y);
    wave.vertex(1000, 1200);
    wave.endShape(CLOSE);
 }
      
  
  void display(int x,int z, color waveCol, int frame)
  { //<>//
    //Same as the setup method except we only update the wave every 10 frames
   this.waveColor = waveCol;
   if(frame % 10 == 0){
     shape(wave,x,z);
      t = t+10;
      float y = noise(t);
      y = map(y,0,1,0,100);
      wave = createShape();
      wave.beginShape();
      wave.fill(waveCol);
      wave.noStroke();
      wave.vertex(0,1200);
      
      for(int i = 0; i < 1000; i++)
      {
       wave.vertex(i,y);
       t = t+.01;
       y = noise(t+10);
       y = map(y,0,1,0,50);
      }
      wave.vertex(1200, y);
      wave.vertex(1000, 1200);
      wave.endShape(CLOSE);
   } else {
     
      shape(wave,x,z);
     
    }
  }
}