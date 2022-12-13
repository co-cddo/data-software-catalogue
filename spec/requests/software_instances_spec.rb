require 'rails_helper'

RSpec.describe "/software_instances", type: :request do
  let(:organisation) { create :organisation }
  let(:valid_attributes) { attributes_for :software_instance, organisation_id: organisation.id }
  let(:software_instance) { create :software_instance, organisation: }

  let(:invalid_attributes) do
    {
      team: '',
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get organisation_software_instances_path(organisation)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get software_instance_path(software_instance)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_organisation_software_instance_path(organisation)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_software_instance_url(software_instance)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SoftwareInstance" do
        expect {
          post organisation_software_instances_path(organisation), params: { software_instance: valid_attributes }
        }.to change(SoftwareInstance, :count).by(1)
      end

      it "redirects to the created software_instance" do
        post organisation_software_instances_path(organisation), params: { software_instance: valid_attributes }
        expect(response).to redirect_to(software_instance_url(SoftwareInstance.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SoftwareInstance" do
        expect {
          post organisation_software_instances_path(organisation), params: { software_instance: invalid_attributes }
        }.to change(SoftwareInstance, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post organisation_software_instances_path(organisation), params: { software_instance: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        attributes_for :software_instance
      end

      it "updates the requested software_instance" do
        patch software_instance_url(software_instance), params: { software_instance: new_attributes }
        software_instance.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the software_instance" do
        patch software_instance_url(software_instance), params: { software_instance: new_attributes }
        software_instance.reload
        expect(response).to redirect_to(software_instance_url(software_instance))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch software_instance_url(software_instance), params: { software_instance: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    before { software_instance }

    it "destroys the requested software_instance" do
      expect {
        delete software_instance_url(software_instance)
      }.to change(SoftwareInstance, :count).by(-1)
    end

    it "redirects to the software_instances list" do
      delete software_instance_url(software_instance)
      expect(response).to redirect_to(organisation_software_instances_path(organisation))
    end
  end
end
