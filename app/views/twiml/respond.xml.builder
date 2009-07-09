xml.instruct!  
xml.Response do
  if @digit.zero? or @action.nil?
    xml.Say 'Error, no digits or answer not found'
    xml.Hangup
  else
    xml.Say "You responded with #{@digit}"
    action = @action.action
    case @action.action_type
     when 'Play'
       xml.Play action
     when 'Say'
       xml.Say action
     when 'Dial'
       xml.Dial action
     when 'Redirect'
       xml.Redirect action
     else
       xml.Say "Action not found error - try again"
       xml.Redirect '/twiml.xml'
    end
  end

end