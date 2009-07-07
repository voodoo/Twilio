namespace :heroku do
  task :config do
    puts "Reading config/config.yml and sending config vars to Heroku..."
    CONFIG = YAML.load_file('config/twilio.yml')['development'] rescue {}
    puts CONFIG.inspect
    command = "heroku config:add"
    CONFIG.each {|key, val| command << " #{key}='#{val}' " if val }
    system command
  end
end