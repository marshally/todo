require 'spec_helper'

describe "todos/new" do
  before(:each) do
    assign(:todo, stub_model(Todo,
      :description => "MyString",
      :priority => 1
    ).as_new_record)
  end

  it "renders new todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todos_path, "post" do
      assert_select "input#todo_description[name=?]", "todo[description]"
      assert_select "input#todo_priority[name=?]", "todo[priority]"
    end
  end
end
