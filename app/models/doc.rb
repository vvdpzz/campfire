class Doc < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  
  mount_uploader :src, FileUploader
end
