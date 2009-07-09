xml.instruct!  
xml.Response do
  if @twiml.nil?
    xml.Say "No default TWIML set up"
  elsif @twiml.gather?
     xml.Gather(:method => 'GET', :numDigits => 1) do
       xml << render(:partial => 'verbs')
     end
  else
    xml << render(:partial => 'verbs')    
  end
end