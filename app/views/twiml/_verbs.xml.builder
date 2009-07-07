for verb in @twiml.verbs
  if verb.verb_type == 'Say'
    xml.Say verb.text
  else
    xml.Play verb.text
  end
end