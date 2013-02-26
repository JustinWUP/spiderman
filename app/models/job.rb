class Job < ActiveRecord::Base
  attr_accessible :link, :city, :jobboard, :company, :posted
  validates :link, :uniqueness => true
end
