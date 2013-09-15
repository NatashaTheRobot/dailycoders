require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "routes to #index" do
      get("/courses/1/sessions").should route_to("sessions#index", course_id: "1")
    end

    it "routes to #new" do
      get("courses/1/sessions/new").should route_to("sessions#new", course_id: "1")
    end

    it "routes to #show" do
      get("/courses/1/sessions/1").should route_to("sessions#show", course_id: "1", id: "1")
    end

    it "routes to #edit" do
      get("/courses/1/sessions/1/edit").should route_to("sessions#edit", course_id: "1", id: "1")
    end

    it "routes to #create" do
      post("/courses/1/sessions").should route_to("sessions#create", course_id: "1")
    end

    it "routes to #update" do
      put("/courses/1/sessions/1").should route_to("sessions#update", course_id: "1", id: "1")
    end

    it "routes to #destroy" do
      delete("/courses/1/sessions/1").should route_to("sessions#destroy", course_id: "1", id: "1")
    end

  end
end
