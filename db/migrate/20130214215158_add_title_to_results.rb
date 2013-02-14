class AddTitleToResults < ActiveRecord::Migration
  def change
  	add_column :results, :title, :string
  end
end
