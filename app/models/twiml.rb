class Twiml < ActiveRecord::Base
  has_many :verbs, :order => :position, :dependent => :destroy
  acts_as_list
  after_create do |twiml|
    # add a default verb
    twiml.verbs.create(:verb_type => 'Say', :text => "Edit #{twiml.name}'s first question, please", :action_type => 'Say', :action => "#{twiml.name}'s response")
  end
  
  #access via name in url - rather than id - /twiml/name.xml
  def to_param
    name
  end
end