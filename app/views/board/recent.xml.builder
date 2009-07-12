xml.instruct!  
xml.Response do
  xml.Gather(:numDigits => 1, :action => "/board/notify?pets=#{@pets.map(&:id).join(',')}") do
    if @pets.empty?
      xml.Say "No pets found"
    else
      @say_location = true
      xml << render(:partial => 'board/pets.xml.builder')
    end
  end
  xml.Say "Recent pets complete"
  xml.Redirect '/board'
end