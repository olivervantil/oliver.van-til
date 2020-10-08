import http.requests.*;

class dataFetch
{
  String publicIP, location, weatherData, description, temperature, feelsLike, minTemp, maxTemp, windSpeed, windAngle;
  
  dataFetch()
  {
    getInfo();    
  }
  
  void getInfo()
  {
    String[] ip = loadStrings("http://checkip.amazonaws.com/"); publicIP = ip[0];
    
    GetRequest ipGrab = new GetRequest("http://api.ipstack.com/"+publicIP+"?access_key=a55eef949d4e9eb370dda4875dc9b863&fields=city"); ipGrab.send();
    location = (ipGrab.getContent()).substring(9, ((ipGrab.getContent()).length()-2)); 
    
    GetRequest weatherGrab = new GetRequest("https://community-open-weather-map.p.rapidapi.com/weather?units=metric&q="+location);
    weatherGrab.addHeader("x-rapidapi-key", "e53076fbc5msh1527d2e119a0ad2p156382jsn69d0ff910cce"); weatherGrab.send(); weatherData = weatherGrab.getContent();
    println(weatherGrab.getContent());
    responseBreakdown();
    
}
  
  void responseBreakdown()
  {
    println(weatherData);
    description = (breakdownResponse("description\":\"","\",\"icon"));
    //description = "rain";
    temperature = (breakdownResponse("\"temp\":",",\"feels_like"));
    feelsLike = (breakdownResponse("\"feels_like\":",",\"temp_min"));   
  }
  
  String breakdownResponse (String primarySearchKey,String secondarySearchKey)
  {
    int descriptionStartIndex = weatherData.indexOf(primarySearchKey);
    int descriptionEndIndex = weatherData.indexOf(secondarySearchKey, descriptionStartIndex);
    String output = weatherData.substring(descriptionStartIndex+primarySearchKey.length(),descriptionEndIndex);
    return((output));   
  }
}
