class Hashit
  def initialize(hash)
    hash.each do |k,v|
      self.instance_variable_set("@#{k}", v)  ## create and initialize an instance variable for this key/value pair
      self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})  ## create the getter that returns the instance variable
      self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})  ## create the setter that sets the instance variable
    end
  end
end

# http://almosteffortless.com/2009/06/25/config-vars-and-heroku/
#CONFIG = (YAML.load_file('config/config.yml')[RAILS_ENV] rescue {}).merge(ENV)

TWILIO = Hashit.new((YAML.load_file(File.join(Rails.root, "config", "twilio.yml"))[Rails.env] rescue {}).merge(ENV))

# Wanted to put this in envs/production.rb!!!!!!!!!!!!!!!!!!!!!!!
# ExceptionNotifier.exception_recipients = %w(paul.vudmaska@gmail.com)
# ExceptionNotifier.sender_address =  "'LaF Error' <#{TWILIO.email_user}>"

