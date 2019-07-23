class DashboardController < ApplicationController
  def index
  end
  def create
  	render plain: params[:reading].inspect
  end
end
