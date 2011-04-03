class Proposal < ActiveRecord::Base
  validates_presence_of :title, :impact
end
