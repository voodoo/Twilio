xml.instruct!  
xml.Response do  
  xml.Say "Thanks for the message, here is your recording"
  xml.Play @recording
  xml.Say "Goodbye"
end