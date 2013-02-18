class Job < ActiveRecord::Base
  attr_accessible :link, :city, :jobboard, :company
  validates :link, :uniqueness => true
end
