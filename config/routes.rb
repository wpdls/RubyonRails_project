Rails.application.routes.draw do
  resources :products
  get 'say/hello'

  get 'say/goodbye'

  get 'addressbook' => 'address_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
