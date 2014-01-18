require "spec_helper"

describe TodosController do
  describe "routing" do

    it "routes to #index" do
      get("/todos").should route_to("todos#index")
    end

    it "routes to #create" do
      post("/todos").should route_to("todos#create")
    end

    it "routes to #update" do
      put("/todos/1").should route_to("todos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/todos/1").should route_to("todos#destroy", :id => "1")
    end

  end
end
