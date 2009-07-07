class Twiml < ActiveRecord::Base
  has_many :verbs, :dependent => :destroy
  
  def to_param
    name
  end
end