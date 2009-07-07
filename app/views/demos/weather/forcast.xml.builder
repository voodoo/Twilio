xml.instruct!  
xml.Response do
  xml.Say "#{@weather[:title]} #{@zip}"
  xml.Say "The temperature is #{@weather[:temp]} degrees"
  xml.Say "Redirecting to Main Menu"
  xml.Redirect "/twilio/board"
end