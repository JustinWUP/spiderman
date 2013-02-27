class PageslikeRegex < ActiveRecord::Migration
  def change
  	add_column :results, :pagesregex, :string 
  end
end
