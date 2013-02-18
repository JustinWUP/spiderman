class AddElementsToResult < ActiveRecord::Migration
  def change
  	add_column :results, :pageslike, :string
  	add_column :results, :element, :string
  	add_column :results, :target, :string
  	add_column :results, :replacement, :string
  end
end
