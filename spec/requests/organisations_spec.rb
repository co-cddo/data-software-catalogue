require 'rails_helper'

RSpec.describe "/organisations", type: :request do
  fixtures :users

  let(:valid_attributes) do
    { name: 'Something new' }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  let(:admin) { fixture :user, :admin }
  let(:user) { fixture :user, :user }
  let(:sign_in_user) { sign_in user }

  let(:organisation) { fixture :organisation, :bar }

  before { sign_in_user }

  describe "GET /index" do
    it "renders a successful response" do
      Organisation.create! valid_attributes
      get organisations_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "prevents access and redirects to root" do
      get new_organisation_url
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      it "renders a successful response" do
        get new_organisation_url
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    it "prevents access and redirects to root" do
      post organisations_url, params: { organisation: valid_attributes }
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

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
  end

  describe "GET /edit" do
    it "prevents access and redirects to root" do
      get edit_organisation_url(organisation)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      it "renders a successful response" do
        get edit_organisation_url(organisation)
        expect(response).to be_successful
      end
    end

    context 'when organisation belongs to user' do
      let(:organisation) { user.organisation }

      it "renders a successful response" do
        get edit_organisation_url(organisation)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    let(:name) { 'Bar' }
    let(:new_attributes) do
      { name: }
    end

    it "prevents access and redirects to root" do
      get edit_organisation_url(organisation)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      context "with valid parameters" do
        it "updates the requested organisation" do
          patch organisation_url(organisation), params: { organisation: new_attributes }
          organisation.reload
          expect(organisation.name).to eq(name)
        end

        it "redirects to the organisation" do
          patch organisation_url(organisation), params: { organisation: new_attributes }
          organisation.reload
          expect(response).to redirect_to(organisation_url(organisation))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch organisation_url(organisation), params: { organisation: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when organisation belongs to user' do
      let(:organisation) { user.organisation }

      it "updates the requested organisation" do
        patch organisation_url(organisation), params: { organisation: new_attributes }
        organisation.reload
        expect(organisation.name).to eq(name)
      end

      it "redirects to the organisation" do
        patch organisation_url(organisation), params: { organisation: new_attributes }
        organisation.reload
        expect(response).to redirect_to(organisation_url(organisation))
      end
    end
  end

  describe "DELETE /destroy" do
    it "prevents access and redirects to root" do
      get edit_organisation_url(organisation)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      it "destroys the requested organisation" do
        expect {
          delete organisation_url(organisation)
        }.to change(Organisation, :count).by(-1)
      end

      it "redirects to the organisations list" do
        delete organisation_url(organisation)
        expect(response).to redirect_to(organisations_url)
      end
    end

    context 'when organisation belongs to user' do
      let(:organisation) { user.organisation }

      it "destroys the requested organisation" do
        expect {
          delete organisation_url(organisation)
        }.to change(Organisation, :count).by(-1)
      end

      it "redirects to the organisations list" do
        delete organisation_url(organisation)
        expect(response).to redirect_to(organisations_url)
      end
    end
  end
end
