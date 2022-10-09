Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
		namespace :v1 do
			post 'items' => 'items#create'
      get 'items' => 'items#index'
      get 'total_info' => 'items#get_total_cost'
    end
  end
end
