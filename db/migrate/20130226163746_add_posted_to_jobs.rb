class AddPostedToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :posted, :string
  end
end
