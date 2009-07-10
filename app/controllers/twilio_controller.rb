class TwilioController < ApplicationController
 before_filter :login_required
 before_filter :admin_required
 layout 'iphone'
end
