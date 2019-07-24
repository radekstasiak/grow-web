namespace :mqtt_task do
  task :my_task1 => :environment do
  	conn_opts = {
  		remote_host: 'm24.cloudmqtt.com',
  		remote_port: 17236,
  		username: 'vlfnelyd',
  		password: 'nXE1FVBVSJHn'
	}
	MQTT::Client.connect(conn_opts) do |c|
    	# The block will be called when you messages arrive to the topic
    	c.get('currentState') do |t, message|
      	puts "Received MQTT message"
      	puts "#{t}: #{message}"
      	jsonMsg = JSON.parse(message)
      	puts "Creating new Reading..."
      	reading = Reading.new
      	reading.name = "Test plant"
      	reading.moisture_level_status = jsonMsg["hmdt_raw_value"]
      	reading.soil_moisture_status = jsonMsg["soil_moisture_status"]
      	reading.water_pump_status = jsonMsg["water_pump_status"]
      	reading.save 
      	puts "Succesfully saved Reading:"
      	puts "#{reading}"
      	exit
	end
end
  end

end