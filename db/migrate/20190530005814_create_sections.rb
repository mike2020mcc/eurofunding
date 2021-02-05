class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
