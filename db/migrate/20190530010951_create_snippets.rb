class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.references :group, foreign_key: true, null: false
      t.string :name, null: false
      t.string :content, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
