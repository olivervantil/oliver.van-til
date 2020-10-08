class cloud 
{
  float posX, posY, sizeX, sizeY;
  color cloudColor = color(255,255,255); 
  boolean rainActive;
  rain Rain;
  
  cloud()
  {
    Rain = new rain();
    posY = Math.round(random(height/2-100,height/2+100));
    Rain.originalY = posY;
    sizeX=random(80,100); sizeY=random(50,60);
  }
  
  
  void draw()
  {
    fill(255,255,255); rect(posX,posY-100,sizeX,sizeY);
  }

  
  void moveCloud()
  {
    posX--;
    
    if(rainActive)
    {
      Rain.posX = posX;
      Rain.draw(); Rain.moveRain();
    }
    
    if(posX<0-sizeX)
    {
      posX=posX+width+sizeX; 
      posY = Math.round(random(height/2-100,height/2+100));
      if(rainActive)
        Rain.originalY = posY;
    }
  }  
}
