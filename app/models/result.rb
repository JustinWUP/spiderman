class Result < ActiveRecord::Base
  attr_accessible :url, :title, :pageslike, :pagesregex, :element, :target, :replacement
end
