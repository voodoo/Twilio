class Pet < ActiveRecord::Base
  belongs_to :user
  validates_format_of :weight, :with => /^\d+$/, :allow_blank => true, :message => "- only numbers"
  
  def no_name
    if self.name.blank?
      'No name'
    else
      self.name
    end
  end
end