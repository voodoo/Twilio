xml.instruct!  
xml.Response do
 xml.Say "Please say your message - and leave a number to call you"
 xml.Record(:action => "/callmes/#{@callme.id}/pet_found_confirm?pet=#{@pet.id}", :maxLength => 30)
end