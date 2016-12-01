class Depth_Meter 
{
  //Start the depth meter at -50m above the ocean
 int meterText = -50;
 
 //Nothing needed to be initialized
 void DepthMeter()
 {
   
 }
 int display(int meter)
 {
   
   //Make the depth meter white
  fill(255,255,255);
  stroke(255,255,255);
  strokeWeight(10);
  line(25,25,25,925);

  //Add up to 10 markings for the depth
  for(int i = 0; i < 10; i++)
  {
    
    if ( meter == 100 )
    {
      meter = 0;
      meterText+=10;
    }
    
    if((i*100)+25-meter < 25) 
    {
      
    } else {
      
      line(27,(i*100)+25-meter,75,(i*100)+25-meter);
      textSize(12);
      text(meterText+i*10+" m", 85, (i*100)+27-meter);
    }
    
  
  }
  meter++;
  return meter;
 }
}