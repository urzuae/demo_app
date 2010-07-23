class Micropost < ActiveRecord::Base
  belongs_to :user
  
  validates_length_of :content, :maximum => 140
  validates_presence_of :content, :user_id

  acts_as_taggable_on :tags

end
