class Micropost < ActiveRecord::Base
  belongs_to :user
  
  validates_length_of :content, :maximum => 140
  validates_presence_of :user_id
  validates_presence_of :content

end

