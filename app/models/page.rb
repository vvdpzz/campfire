class Page < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  
  default_scope :order => 'created_at DESC' 
end
