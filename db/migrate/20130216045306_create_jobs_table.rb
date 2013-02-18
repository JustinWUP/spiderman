class CreateJobsTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :link
      t.string :city
      t.string :jobboard
      t.string :company
      t.timestamps
    end
  end
end
