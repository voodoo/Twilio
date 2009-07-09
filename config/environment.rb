# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

require 'net/http'

Rails::Initializer.run do |config|
  config.gem 'will_paginate', :version => '~> 2.3.8', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.time_zone = 'UTC'
end




ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => TWILIO.email_smtp,
    :port => "587",
    #:domain => "intgrated.com",
    :authentication => :plain,
    :user_name => TWILIO.email_user,
    :password => TWILIO.email_password 
  }