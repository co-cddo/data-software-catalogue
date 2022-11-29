require 'rails_helper'

RSpec.describe "/organisations", type: :request do
  fixtures :all

  let(:valid_attributes) do
    { name: 'Foo'  }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  let(:user) { users :admin }

  before { sign_in user }

  describe "GET /index" do
    it "renders a successful response" do
      Organisation.create! valid_attributes
      get organisations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      organisation = Organisation.create! valid_attributes
      get organisation_url(organisation)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_organisation_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      organisation = Organisation.create! valid_attributes
      get edit_organisation_url(organisation)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Organisation" do
        expect {
          post organisations_url, params: { organisation: valid_attributes }
        }.to change(Organisation, :count).by(1)
      end

      it "redirects to the created organisation" do
        post organisations_url, params: { organisation: valid_attributes }
        expect(response).to redirect_to(organisation_url(Organisation.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Organisation" do
        expect {
          post organisations_url, params: { organisation: invalid_attributes }
        }.to change(Organisation, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post organisations_url, params: { organisation: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:name) { 'Bar' }
      let(:new_attributes) do
        { name: name }
      end

      it "updates the requested organisation" do
        organisation = Organisation.create! valid_attributes
        patch organisation_url(organisation), params: { organisation: new_attributes }
        organisation.reload
        expect(organisation.name).to eq(name)
      end

      it "redirects to the organisation" do
        organisation = Organisation.create! valid_attributes
        patch organisation_url(organisation), params: { organisation: new_attributes }
        organisation.reload
        expect(response).to redirect_to(organisation_url(organisation))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        organisation = Organisation.create! valid_attributes
        patch organisation_url(organisation), params: { organisation: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested organisation" do
      organisation = Organisation.create! valid_attributes
      expect {
        delete organisation_url(organisation)
      }.to change(Organisation, :count).by(-1)
    end

    it "redirects to the organisations list" do
      organisation = Organisation.create! valid_attributes
      delete organisation_url(organisation)
      expect(response).to redirect_to(organisations_url)
    end
  end
end
