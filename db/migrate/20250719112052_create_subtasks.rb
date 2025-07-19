class CreateSubtasks < ActiveRecord::Migration[8.0]
  def change
    create_table :subtasks do |t|
      t.references :parent, null: false, foreign_key: { to_table: :tasks }
      t.references :child, null: false, foreign_key: { to_table: :tasks }

      t.timestamps
    end
  end
end
