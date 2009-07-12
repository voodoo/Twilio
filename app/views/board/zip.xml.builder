xml.instruct!  
xml.Response do
  xml.Gather(:numDigits => 5, :action => "/board/search?lof=#{@digit}") do
    xml.Say "Searching for lost or found pets in your area"
    xml.Say "Please enter a 5 digit zip code"
  end
end