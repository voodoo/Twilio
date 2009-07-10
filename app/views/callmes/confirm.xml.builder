xml.instruct!  
xml.Response do
  if @digit
    xml.Say "Thank you, call me has been verified and will start tomorrow, if a pet is found"
    xml.Redirect '/board'
  else
    xml.Gather do
      xml.Say "Just calling to confirm your Call me request"
      xml.Say "Press 1 to confirm"
    end
  end
end