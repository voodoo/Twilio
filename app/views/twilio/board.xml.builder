xml.instruct!  
xml.Response do
  if @digit    
    case @digit
      when '1'
        xml.Say "Loading Hello world"
        xml.Redirect('/hello')
      when '2'
        xml.Say "Weather"
        xml.Redirect('/weather')
      when '3'
        xml.Say "Loading Appointment"
        xml.Redirect('/appointment')
      else
        xml.Say "App not found. Good bye."
        xml.Hangup
    end
  else
    xml.Gather(:numDigits => 1) do
      xml.Say "Press 1 for Hello world"
      xml.Say "Press 2 for Weather"
      xml.Say "Press 3 for Appointment Reminder"
    end
  end
end