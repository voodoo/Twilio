# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  protected
  def twilio_connect
    require 'net/http'
    uri = URI.parse("#{TWILIO.url}/#{TWILIO.sid}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth TWILIO.sid, TWILIO.token
    response = http.request(req)
    logger.info response.body
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
