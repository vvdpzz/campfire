class Doc < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  
  default_scope :order => 'created_at DESC' 
  
  mount_uploader :src, FileUploader
end
