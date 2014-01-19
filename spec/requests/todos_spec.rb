require 'spec_helper'

describe "Todos" do
  describe "GET /todos" do
    let(:user_attributes) { { password: "12345678" } }
    let(:user) { User.create_with(user_attributes).find_or_create_by!(email: "marshall@yountlabs.com") }

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
      get todos_path
      response.status.should be(200)
    end
  end
end
