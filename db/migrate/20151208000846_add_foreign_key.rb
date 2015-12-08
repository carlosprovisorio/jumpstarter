class AddForeignKey < ActiveRecord::Migration
  def change
  	add_column :projects, :user_id, :integer
  	add_column :rewards, :project_id, :integer
  	add_column :pledges, :reward_id, :integer
  end
end
