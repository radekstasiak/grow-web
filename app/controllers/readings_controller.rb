class ReadingsController < ApplicationController

	def new

	end
	def create
  		render plain: params[:reading].inspect
  	end
end
