class Theme < ActiveRecord::Base
  validates_presence_of :title
  
  has_many :proposals
end
