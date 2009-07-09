xml.instruct!  
xml.Response do
  xml.Gather(:numDigits => 5, :action => "/board/search?lof=#{@digit}") do
    xml.Say "Searching for #{@digit == '1' ? 'found' : 'lost'} animals"
    xml.Say "Please enter a 5 digit zip code"
  end
end