class DescriptionShouldBeNotNullOnTodo < ActiveRecord::Migration
  def change
    change_column :todos, :description, :string, :null => false
  end
end
