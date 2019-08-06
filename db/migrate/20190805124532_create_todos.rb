class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :description
      t.boolean :completed, default: false
      t.datetime :completed_at
      t.integer :position, default: 0
      t.string :created_by
      t.string :completed_by

      t.timestamps
    end
  end
end
