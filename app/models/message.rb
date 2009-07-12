class Message < ActiveRecord::Base
  belongs_to :user
  validates_format_of :email,:allow_blank => true, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :message
end