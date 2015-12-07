class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :price
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
