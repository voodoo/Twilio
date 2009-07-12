xml.Say "#{@pets.size} pets were found"

@pets.each_with_index do |pet,i|
  xml.Say "A #{pet.sex} #{pet.dog_or_cat} was #{pet.lost_or_found} with the following characteristics"
  
  if @say_location
    xml.Say "Found in"
    unless pet.user.city.blank?
      xml.Say "city #{pet.user.city}"
    end    
    unless pet.user.state.blank?
      xml.Say "state #{pet.user.state}"
    end    
    xml.Say "zip #{pet.user.zip.spaced}"
  end
  
  unless pet.name.blank?
    xml.Say "Name is #{pet.name}"
  end
  
  unless pet.breed.blank?
    xml.Say "Breed is #{pet.breed}"
  end
            
  unless pet.weight.blank?
    xml.Say "Weight #{pet.weight} pounds"
  end        

  unless pet.color.blank?
    xml.Say "Color is #{pet.color}"
  end   
       
  unless pet.description.blank?
    xml.Say "A short description of the pet follows"
    xml.Say pet.description
  end  
        
  xml.Say "Press #{i + 1} to notify the owner"
end