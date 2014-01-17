class ChangeCompletedAtToBoolean < ActiveRecord::Migration
  def up
    add_column :todos, :completed, :boolean, :null => false, :default => false
    Todo.where("completed_at IS NOT NULL").update_all(:completed => true)
    remove_column :todos, :completed_at
  end

  def down
    raise NotImplementedError
  end
end
