xml.instruct!  
xml.Response do  
  xml.Say "Please record your message at the tone"
  xml.Record :action => "/recorder/play", :maxLength => 10
end