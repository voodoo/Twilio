xml.instruct!  
xml.Response do
    xml.Gather(:numDigits => 1, :action => "/callmes/#{params[:id]}/pet_found?pets=#{params[:pets]}") do
      for pet in @pets
        xml.Say "#{@pets.size} pets were found"
        @pets.each_with_index do |pet,i|
          xml.Say "A #{pet.sex} #{pet.dog_or_cat} was found with the following characteristics"

          unless pet.name.blank?
            xml.Say "Name is #{pet.name}"
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

          xml.Say "Press #{i + 1} to leave a message for the person who found the pet"
        end
      end
    end
  end
end