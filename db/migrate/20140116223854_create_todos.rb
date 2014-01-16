class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.integer :priority
      t.datetime :due_at
      t.datetime :completed_at

      t.timestamps
    end
    add_index :todos, :priority
    add_index :todos, :due_at
    add_index :todos, :completed_at
  end
end
