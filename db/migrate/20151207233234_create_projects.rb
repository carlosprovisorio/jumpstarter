class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :goal
      t.boolean :active
      t.text :description

      t.timestamps null: false
    end
  end
end
