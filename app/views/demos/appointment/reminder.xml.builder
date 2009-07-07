xml.instruct!  
xml.Response do  
  xml.Say "Just calling to remind you your are late for your appointment at #{Time.now}"
  xml.Say "Redirecting to main menu"
  xml.Redirect "/twilio/board"
end