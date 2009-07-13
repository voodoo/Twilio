class Pet < ActiveRecord::Base
  belongs_to :user
  validates_format_of :weight, :with => /^\d+$/, :allow_blank => true, :message => "- only numbers"
  named_scope :dogs, :conditions =>  ['dog_or_cat = ?', 'Dog',], :order => 'updated_at desc'
  named_scope :cats, :conditions =>  ['dog_or_cat = ?', 'Cat',], :order => 'updated_at desc'
  named_scope :found, :conditions =>  ['lost_or_found = ?', 'Found',], :order => 'updated_at desc'
  named_scope :lost, :conditions => ['lost_or_found = ?', 'Lost',], :order => 'updated_at desc'
  
  # take out chars from mask
  def before_validation
    self.weight.gsub!(/\D/,'')
  end
  
  def no_name
    if self.name.blank?
      'Unknown name'
    else
      self.name
    end
  end
  def self.search pet, page
    Pet.find(:all,
    :include    => :user, 
    :conditions => Condition.block { |c| 
      c.and :sex, pet[:sex]
      c.and :dog_or_cat, pet[:dog_or_cat]
      c.and :lost_or_found, pet[:lost_or_found]
      c.and  'users.zip', pet[:zip] unless pet[:zip].blank?
    }).paginate(:page => page)
  end
end