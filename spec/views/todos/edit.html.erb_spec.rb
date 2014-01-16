require 'spec_helper'

describe "todos/edit" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :description => "MyString",
      :priority => 1
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do
      assert_select "input#todo_description[name=?]", "todo[description]"
      assert_select "input#todo_priority[name=?]", "todo[priority]"
    end
  end
end
