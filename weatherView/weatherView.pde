dataFetch DataFetch;
viewPort ViewPort;

float rotationPosX;
float rotationPosY;

float rotateX;

void setup()
{
  size(1200, 700); pixelDensity(displayDensity());
  
  DataFetch = new dataFetch(); ViewPort = new viewPort();

  ViewPort.userInfo = (DataFetch.publicIP+", "+DataFetch.location);
  ViewPort.description = DataFetch.description; 
  ViewPort.feelsLike = DataFetch.feelsLike;
  ViewPort.temperature = DataFetch.temperature;
  ViewPort.location = DataFetch.location;
  ViewPort.levelScene = true;
}

void draw()
{
  background(30,30,30); ViewPort.updateView();
}

void keyPressed()
{
  if (key == 'o')
  {
    ViewPort.currentHour++;
    ViewPort.clockOverride = true;
  }
  if (key == 'i')
  {
    ViewPort.currentHour--;
    ViewPort.clockOverride = true;
  }
  if(key == 'u')  
    ViewPort.clockOverride = false;  
}
