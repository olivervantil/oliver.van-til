class rain 
{
  float posX, posY, sizeX, sizeY, originalY = 0;
  color rainColor = color(0,0,255); 
  
  rain()
  {
    sizeX=random(10,20); sizeY=random(10,20);
  }
  
  
  void draw()
  {
    if(originalY != 0)
    {
      fill(rainColor); rect(posX,posY,sizeX,sizeY);
    }
  }

  
  void moveRain()
  {
    posY = posY + 6;  
    
    if(posY>height+sizeY && originalY != 0)
    {
      posY = Math.round(random(height/2-100,height/2+100));
    }
  }  
}
