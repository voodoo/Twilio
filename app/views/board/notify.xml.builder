xml.instruct!  
xml.Response do
  xml.Say "Please record a message, including contact information, to send to this person"
  xml.Record(:action => "/board/notify_confirmation?pet=#{@pet.id}", :maxLength => 30)
end