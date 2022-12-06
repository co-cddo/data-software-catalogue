require "rails_helper"

RSpec.describe SoftwareInstancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/software_instances").to route_to("software_instances#index")
    end

    it "routes to #new" do
      expect(get: "/software_instances/new").to route_to("software_instances#new")
    end

    it "routes to #show" do
      expect(get: "/software_instances/1").to route_to("software_instances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/software_instances/1/edit").to route_to("software_instances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/software_instances").to route_to("software_instances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/software_instances/1").to route_to("software_instances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/software_instances/1").to route_to("software_instances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/software_instances/1").to route_to("software_instances#destroy", id: "1")
    end
  end
end
