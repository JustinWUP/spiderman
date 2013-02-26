class AddCellFieldsToResults < ActiveRecord::Migration
  def change
  	add_column :results, :linkcell, :string
  	add_column :results, :companycell, :string
  	add_column :results, :citycell, :string
  	add_column :results, :postedcell, :string
  end
end
