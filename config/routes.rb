Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  		get 'index/index'
  		get 'index/products'
  		get 'index/partners'
  		get 'index/vacancies'
  		root to: 'index#index'
		get '/' => 'index#index' 
		get '/products' => 'index#products' 
		get '/partners' => 'index#partners'
		get '/vacancies' => 'index#vacancies'


		 match '/contacts',     to: 'contacts#new',             via: 'get'
		resources "contacts", only: [:new, :create]
	end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
