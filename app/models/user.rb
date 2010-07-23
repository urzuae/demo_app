class User < ActiveRecord::Base
  has_many :microposts
  
  validates_presence_of :name, :email
  validates_format_of :email, :with => /[\da-z]+([\._-]?[\da-z])+@[\da-z]+(\.[\da-z]+)+$/i
end
