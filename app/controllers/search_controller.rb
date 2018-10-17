class SearchController < ApplicationController
  def index
    @search = StationSearch.new(params[:zip_code])
  end
end
