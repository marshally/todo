require 'spec_helper'

describe "todos/index" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :description => "Description1",
        :priority => 1
      ),
      stub_model(Todo,
        :description => "Description2",
        :priority => 2
      )
    ])
  end

  it "renders a list of todos" do
    render
    expect(view).to render_template(:partial => "_form", :count => 4)
    expect(rendered).to include("Description1")
    expect(rendered).to include("Description2")
  end
end
