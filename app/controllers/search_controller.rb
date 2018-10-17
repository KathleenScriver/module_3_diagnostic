class SearchController < ApplicationController
  def index
    @search = Station.new(params[:zip_code]).closest
  end
end
