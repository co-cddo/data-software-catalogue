require 'rails_helper'

RSpec.describe "Searches", type: :request do
  let(:not_found_message) { 'Software not found for this search' }

  describe "GET /index" do
    it "returns http success" do
      get search_index_path
      expect(response).to have_http_status(:success)
    end

    it "display nothing found message" do
      get search_index_path
      expect(response.body).to include(not_found_message)
    end

    context 'with a matching item' do
      let(:software_instance) { create :software_instance }

      it "returns http success" do
        get search_index_path(q: software_instance.product)
        expect(response).to have_http_status(:success)
      end

      it "does not display nothing found message" do
        get search_index_path(q: software_instance.product)
        expect(response.body).not_to include(not_found_message)
      end

      it "displays the matching instance" do
        get search_index_path(q: software_instance.product)
        expect(response.body).to include(software_instance.name)
      end
    end
  end
end
