class HomeController < ApplicationController
  def settings
    if request.post?
      puts 'u'*33
      Twilio.first.update_attributes(params[:twilio])
    end
  end
end
