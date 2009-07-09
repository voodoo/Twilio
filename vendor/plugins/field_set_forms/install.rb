# Install hook code here

unless File.exist?("#{RAILS_ROOT}/public/stylesheets/fieldset_forms.css")
  File.open("#{RAILS_ROOT}/public/stylesheets/fieldset_forms.css", "w") do |f|
    css_content =<<END
form label {
    display: block;
}
input[type='submit'] {
    margin: 1.5em 0.5em 2em 0em;
}
.fieldset {
    margin-bottom: 1.2em;
}
.fieldset * {
    margin-right: 4px;
}
.fieldWithErrors input {
    background: #FFE5E5;
    border: 2px solid red;
    min-height: 1.7em;
}
.inline_error_message {
    color: red;
    display: inline;
}
END
    f.puts css_content
  end
end