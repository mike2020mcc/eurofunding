class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :section, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
