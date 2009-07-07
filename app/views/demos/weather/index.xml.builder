xml.instruct!  
xml.Response do
  xml.Gather(:numDigits => 5, :action => "/weather/forcast" ) do 
    xml.Play "http://www.twilio.com/resources/code/demos/weatherbyphone/greeting.wav"
    xml.Say "Please enter a 5 digit zip code"
  end
end