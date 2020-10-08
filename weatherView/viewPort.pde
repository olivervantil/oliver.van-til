class viewPort
{
  boolean isLoading = false, levelScene = false, cloudActive = false, rainActive = false, clockOverride = false;

  String userInfo, description, temperature, feelsLike, location;

  int clockPhase;
  
  int j= 0, i = 0, currentHour = 0;
  
  float skyVal;

  int[][][] cloudData = new int[10][10][10];
  cloud clouds[];
  

  viewPort()
  {
    background(30, 30, 30);
    clouds = new cloud[10];
    
    if(DataFetch.description.contains("cloud"))
      cloudActive = true;
    if(DataFetch.description.contains("rain"))
    {
      rainActive = true;
      cloudActive = true;
    }
     
    if(cloudActive == true)
    {
      for (int i = 0; i < clouds.length; i++)
      {
        clouds[i] = new cloud();
        clouds[i].posX = (width/10*i)+random(10, 40);
      }
    }
  }

  void updateView()
  {
    if (isLoading)
      drawLoadingScreen(); 
    if (levelScene)
      drawScene();
  }  

  void drawLoadingScreen()
  {      
    if (i<=200)
      i = i+2;

    if (i>=200&&j<210)
      j = j+7;

    background(30, 30, 30);

    rectMode(CENTER); 
    fill(255, 255, 255, 200-j); 
    rect(width/2, height/2, 200, 40);
    rectMode(CORNER); 
    fill(52, 235, 137, 200-j); 
    rect(width/2-100, height/2-20, i, 40);

    if (j>=210)
    {
      i = 0; 
      j = 0;    
      isLoading=false; 
    }
  }

  void clock()
  {
    if(currentHour>= 0 && currentHour<= 5||(currentHour>= 21 && currentHour<= 24))   
      clockPhase = 1;  
    if(currentHour>= 5 && currentHour<= 6||(currentHour>= 20 && currentHour<= 21))  
      clockPhase = 2;    
    if(currentHour>= 6 && currentHour<= 7||(currentHour>= 19 && currentHour<= 20))    
      clockPhase = 3;   
    if(currentHour>= 7 && currentHour<= 19)   
      clockPhase = 4;
        
    if(clockOverride == false)    
      currentHour = hour();
       
    skyVal = lerp(0.2, 1, ((clockPhase/5.0))); background(0, 174*skyVal, 255*skyVal);     
  
  }

  void drawScene()
  {
    clock(); drawText();
    rectMode(CENTER); fill(0, 102, 2); rect(width/2, height-100, width, 200);
    
    if(cloudActive||rainActive)
    {            
      for (int i = 0; i < clouds.length; i++)
        {
          if(description.contains("rain"))
            clouds[i].rainActive = true;
          else
            clouds[i].rainActive = false;        
          clouds[i].draw(); clouds[i].moveCloud();
        }
    }
  }

  void drawText()
  {
    textAlign(LEFT); fill(255,255,255);
    text("It is currently " + temperature + "°C in " + location + " with " + description + ".", 20, 30);
    text("Current hour is "+currentHour+". This is set by your device, but you can change it with O and I.", 20, 50);   
  }
}
