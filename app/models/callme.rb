class Callme < ActiveRecord::Base

  validates_format_of :phone, :with => /^\d{10}$/, :message => "10 digits - no spaces"
  validates_format_of :zip, :with => /^\d{5}$/, :message => "5 digits - no spaces"

  # take out chars from mask
  def before_validation
    self.phone.gsub!(/\D/,'')
  end

  def validate
    if Callme.find(:first, :conditions => ["phone = ? and zip = ? and created_at > ?", self.phone, self.zip, 7.days.ago])
      errors.add_to_base("Already have a Call Me! in the system - try again after 7 days")
    end
  end
  
  def self.reminders
    @calls = Callme.find(:all, :conditions => ["created_at > ? and confirmed = ?", 7.days.ago, true])
    for calling in @calls
      pets   = Pet.find(:all, 
                        :conditions => ["users.zip = ? and lost_or_found = 'Found'", calling.zip], 
                        :include => :user, :limit => 9)
      # No call needed
      next if pets.empty?    
      # Send pets along and save a query
      pet_ids = pets.map(&:id).join(',')
      url = "#{TWILIO.app_url}/callmes/#{calling.id}/callme?pets=#{pet_ids}"
      puts url
      Twilio.connect(TWILIO.sid, TWILIO.token)
      puts Twilio::Call.make(TWILIO.phone, calling.phone, url)      
    end
  end
end