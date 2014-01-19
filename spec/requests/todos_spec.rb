require 'spec_helper'

describe "Todos" do
  describe "GET /todos" do
    let(:user_attributes) { { password: "12345678" } }
    let(:user) { User.create_with(user_attributes).find_or_create_by!(email: "marshall@yountlabs.com") }

    context "when not logged in" do
      it "GET /todos" do
        get todos_path
        expect(response.status).to be(302)
      end

      it "GET /todos.json" do
        get todos_path, format: "json"
        expect(response.status).to be(401)
      end
    end

    context "with invalid credentials" do
      it "GET /todos.json" do
        get todos_path, format: "json", email: "bad", token: "credentials"
        expect(response.status).to be(401)
      end
    end

    context "when logged in" do
      it "GET /todos" do
        post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
        get todos_path
        expect(response).to be_ok
      end

      it "GET /todos.json" do
        get todos_path, format: "json", email: user.email, token: user.authentication_token
        expect(response).to be_ok
      end
    end
  end
end
