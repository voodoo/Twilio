class Verb < ActiveRecord::Base
  belongs_to :twiml
  acts_as_list :scope => :twiml_id
end