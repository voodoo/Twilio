xml.instruct!  
xml.Response do
  if @digit
    xml.Say "Thank you, call me has been verified and will start tomorrow, if a pet is found"
    xml.Redirect '/board'
  else
    xml.Gather do
      xml.Say "Lost &amp; Found Dogs and Cats calling to confirm your call me request"
      xml.Say "Press 1 to confirm"
    end
  end
end