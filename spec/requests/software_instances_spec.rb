require 'rails_helper'

RSpec.describe "/software_instances", type: :request do
  fixtures :users, :organisations

  let(:organisation) { create :organisation }
  let(:valid_attributes) { attributes_for :software_instance, organisation_id: organisation.id }
  let(:software_instance) { create :software_instance, organisation: }

  let(:invalid_attributes) do
    { team: '' }
  end

  let(:admin) { fixture :user, :admin }
  let(:user) { fixture :user, :user }
  let(:sign_in_user) { sign_in user }

  before { sign_in_user }

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
    it "prevents access and redirects to index" do
      get new_organisation_software_instance_path(organisation)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      it "renders a successful response" do
        get new_organisation_software_instance_path(organisation)
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    subject(:post_software_instance) do
      post organisation_software_instances_path(organisation), params:
    end

    let(:params) do
      { software_instance: valid_attributes }
    end

    it "prevents access and redirects to index" do
      post_software_instance
      expect(response).to redirect_to(root_url)
    end

    context "when user is admin" do
      let(:sign_in_user) { sign_in admin }

      context "with valid parameters" do
        it "creates a new SoftwareInstance" do
          expect { post_software_instance }.to change(SoftwareInstance, :count).by(1)
        end

        it "redirects to the created software_instance" do
          post_software_instance
          expect(response).to redirect_to(software_instance_url(SoftwareInstance.last))
        end
      end

      context "with invalid parameters" do
        let(:params) do
          { software_instance: invalid_attributes }
        end

        it "does not create a new SoftwareInstance" do
          pending("Software instance validation should be restored")
          expect { post_software_instance }.to change(SoftwareInstance, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          pending("Software instance validation should be restored")
          post_software_instance
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "GET /edit" do
    it "prevents access and redirects to index" do
      get edit_software_instance_url(software_instance)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      it "renders a successful response" do
        get edit_software_instance_url(software_instance)
        expect(response).to be_successful
      end
    end

    context 'when organisation belongs to user' do
      let(:organisation) { user.organisation }

      it "renders a successful response" do
        get edit_software_instance_url(software_instance)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) do
      attributes_for :software_instance
    end

    it "prevents access and redirects to index" do
      get edit_software_instance_url(software_instance)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      context "with valid parameters" do
        it "updates the requested software_instance" do
          patch software_instance_url(software_instance), params: { software_instance: new_attributes }
          software_instance.reload
          expect(software_instance.name).to eq(new_attributes[:name])
        end

        it "redirects to the software_instance" do
          patch software_instance_url(software_instance), params: { software_instance: new_attributes }
          software_instance.reload
          expect(response).to redirect_to(software_instance_url(software_instance))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          pending("Software instance validation should be restored")
          patch software_instance_url(software_instance), params: { software_instance: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when organisation belongs to user' do
      let(:organisation) { user.organisation }

      it "updates the requested software_instance" do
        patch software_instance_url(software_instance), params: { software_instance: new_attributes }
        software_instance.reload
        expect(software_instance.name).to eq(new_attributes[:name])
      end

      it "redirects to the software_instance" do
        patch software_instance_url(software_instance), params: { software_instance: new_attributes }
        software_instance.reload
        expect(response).to redirect_to(software_instance_url(software_instance))
      end
    end
  end

  describe "DELETE /destroy" do
    it "prevents access and redirects to index" do
      delete software_instance_url(software_instance)
      expect(response).to redirect_to(root_url)
    end

    context 'when user is admin' do
      let(:sign_in_user) { sign_in admin }

      it "destroys the requested software_instance" do
        software_instance # make sure it exists before count
        expect {
          delete software_instance_url(software_instance)
        }.to change(SoftwareInstance, :count).by(-1)
      end

      it "redirects to the software_instances list" do
        delete software_instance_url(software_instance)
        expect(response).to redirect_to(organisation_software_instances_path(organisation))
      end
    end

    context 'when organisation belongs to user' do
      let(:organisation) { user.organisation }

      it "destroys the requested software_instance" do
        software_instance # make sure it exists before count
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
end
