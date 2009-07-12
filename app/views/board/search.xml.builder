xml.instruct!  
xml.Response do
  xml.Gather(:numDigits => 1, :action => "/board/notify?pets=#{@pets.map(&:id).join(',')}") do
    xml.Say "Searching zip code #{@zip_spaced}"
    if @pets.empty?
      xml.Say "No pets found"
    else
      xml << render(:partial => 'board/pets.xml.builder')
    end
  end
  xml.Say 'Search results complete'
  xml.Redirect '/board'
end