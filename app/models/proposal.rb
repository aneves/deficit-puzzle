class Proposal < ActiveRecord::Base
  validates_presence_of :title, :impact
  validates_numericality_of :impact#, :only_integer => true
end
