class SearchController < ApplicationController
  def index
    result = PgSearch.multisearch(params[:q]).limit(10)
    @software_instances = result.map(&:searchable)
  end
end
