
int sizeX;
int sizeY;

int frame;

float subX, subY;

int oceanFrame;
int oceanColor;

int waveFrame;
int meterX1;

int bubX,bubY;
float chk = .2;
float randY;
float randX;
float randZ;

float modPos=2;
float modNeg=1;

PImage img;
PImage img2;

Depth_Meter mtr;

Wave wave;

Bubbles[] bubbleArray;

int[] bubbleYs;
int[] bubbleXs;

PShape light1;
PShape light2;

void setup() 
{
  //set the display
  sizeX= 1000;
  sizeY = 1000;
  size(1000, 1000);
   background(#59D6FF);
  noStroke();
  
  //frame counter used for various parts of updating
  frame = 0;
  
  //Make a new depth meter. 
  mtr = new Depth_Meter();
  
  //Set up the water
  fill(#59D6FF);
  rect(0,0,sizeX,sizeY);
  
  //Store the bubbles that will be coming out of the sub
  bubbleArray = new Bubbles[20];
  bubbleYs = new int[20];
  bubbleXs = new int[20];
  meterX1 = 0;
  
  //Make the wave that will be seen at the begining
  wave = new Wave(color(40-frame,211-frame,200-frame));
  
  for(int i = 0; i < 20; i++)
  {
    bubbleArray[i] = new Bubbles(); 
  }
  for(int i = 0; i < 20; i++)
  {
   bubbleYs[i] = 0; 
  }
  
  //sub lights
  light1 = createShape();
  light1.beginShape();
  light1.fill(250,250,250,200);
  light1.noStroke();
  light1.vertex(0,0);
  light1.vertex(80,200);
  light1.vertex(-80,200);
  light1.endShape();
  
  light2 = createShape();
  light2.beginShape();
  light2.fill(250,250,250,200);
  light2.noStroke();
  light2.vertex(0,0);
  light2.vertex(80,200);
  light2.vertex(-80,200);
  light2.endShape();
  
  img = loadImage("2dboat.png");  // Load an image into the program 
  img2 = loadImage("sub.png");
}

void draw ()
{
  noStroke();
  
  // Display at full opacity
  fill(#59D6FF);
  rect(0,0,sizeX,sizeY);
  
  colorMode(RGB);
  
  //Used to move the wave up until its no longer visible
  frame++;
  if ( frame < 500 ) 
  {
    oceanFrame++;
  }
  
  //Ocean Color
  fill(40-oceanColor,191-oceanColor,200-oceanColor,200);
  rect(0,abs(500-oceanFrame),sizeX,sizeY);
  
  //Boat
  img.resize(500,400);
  image(img, 500, 300-frame);
  
  //Wave
  wave.display(0,460-waveFrame,color(40-oceanColor,211-oceanColor,190-oceanColor,400), frame);
  //Same as the ocean background, push it up until its no longer visible
  if( frame < 560)
  {
    waveFrame++;
  }
 
  //Sub movement
  if(frame % 1 == 0)
  {
    if(subX+400 > 650) 
    {
      chk = .8;
      modPos = .5;
      modNeg = .5;
    }
    else if(subX+400 < 250)
    {
     chk = .2;
     modPos = .5;
     modNeg = .5;
    }
    subY = random(0,1);
    if(subY < chk)
    {
      subX -= modNeg;
    } else {
      subX+=modPos;
      
    }
  }
  //Sub bubbles
  if(frame < 300) 
  {
    for(int i = 0; i < 20; i++)
    {
     bubbleYs[i] = (int)subX;  
    }
  }
  else {
  for(int i = 0; i < 20; i++)
    {
      randY = random(0,1);
      if(randY < 0.2)
      {
        bubbleYs[i] += 1;
        if(frame % 5 == 4)
        {
          bubbleXs[i] += random(-10,10);
        }
        if(bubbleYs[i]+450 <= 0)
        {
         bubbleYs[i] = (int)subX; 
        }
        bubbleArray[i].display(480+bubbleXs[i],450+bubbleYs[i],oceanColor);
      }
      else{
        bubbleYs[i] -= 3;
        if(frame % 5 == 4)
        {
          bubbleXs[i] += random(-10,10);
        }
        if(bubbleYs[i]+450 <= 0)
        {
         bubbleYs[i] = (int)subX; 
        }
       bubbleArray[i].display(480+bubbleXs[i],450+bubbleYs[i],oceanColor);
      }
       //<>//
    }
  }
  
  //Sub Lights
  if(frame % 100 == 0)
  {
   randX = 0 - randX; 
   randZ = 0 - randZ;
  }
  
  if(frame % 1 == 0)
  {
    randX += random(0,.0005);
    randZ += random(-.0005,0);
    light1.rotate(randX);
    light2.rotate(randZ);
  }
  shape(light1, 450,500+subX);
  shape(light2, 550,500+subX);
  img2.resize(300,200);
  tint(255-oceanColor,255-oceanColor,255-oceanColor);
  image(img2, 360, 400+subX); 
  
  //Depth Meter
  meterX1 = mtr.display(meterX1);

  noStroke();
  fill(175);
  
  //Change the ocean color every 40 frames //<>//
  if(frame % 40 == 39)
  {
     oceanColor++; 
  }
}