class Job < ActiveRecord::Base
  attr_accessible :link, :city, :jobboard, :company, :posted
  validates :link, :uniqueness => true
  searchable :auto_index => true do
  	text :company, :link, :city, :jobboard 	
  end

end
