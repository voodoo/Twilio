module ApplicationHelper
   # Outputs the corresponding flash message if any are set, include :fade in seconds for scriptaculous fade effect
   def flash_messages(options={})
     html = content_tag(:div, flash.collect{ |key,msg| content_tag(:div, msg, :class => "box #{key}") }, :id => 'flash-message')
     if options.key?(:fade)
       html << content_tag(:script, "setTimeout(\"$('#flash-message').fadeOut();\",#{options[:fade] * 1000})", :type => 'text/javascript')
     end
     html
   end
end