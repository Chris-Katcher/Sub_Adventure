class Bubbles
{
  PImage bubble;
  
  //Nothing needed in the constructor
  void Bubbles()
  {
    
  }
  void display(int x, int y, int oceanColor)
  {
    
    //Load the bubble image and place it at the input location with the input tint
    this.bubble = loadImage("bubble.png");
    bubble.resize(25,25);
    tint(255-oceanColor,255-oceanColor,255-oceanColor);
    image(bubble,x, y);
  }
}