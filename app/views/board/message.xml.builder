xml.instruct!  
xml.Response do
  if @recordingUrl
    xml.Say "Thank you. Please hang up - or wait to start over"
    xml.Redirect '/board'    
  else
    xml.Say "Please record your message. Press any key when done."
    xml.Record(:action => '/board/message', :maxLength => 15)  
  end

end