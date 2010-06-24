class User < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :holidays, :dependent => :destroy
end
