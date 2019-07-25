Rails.application.routes.draw do
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :readings
  root 'dashboard#index'

  scope '/api' do
  	scope '/v1' do
  		resources :readings, :controller=>"api_readings"
  	end
  end
end
