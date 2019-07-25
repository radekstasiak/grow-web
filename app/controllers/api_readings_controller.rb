class ApiReadingsController < ApplicationController

	def new

	end

	def index
		@readings = Reading.all

    puts "#{@readings.size}"
    render :json => @readings
	end
	def create
  
  end

  def show
	 @reading = Reading.find(params[:id])
  end

  private
  	def reading_params
    	params.require(:reading).permit(:name, :moisture_level_status,:soil_moisture_status,:water_pump_status)
    end
end
