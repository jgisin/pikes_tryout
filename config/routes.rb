Rails.application.routes.draw do
  resources :players
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'register' => 'players#new'
  get 'step_two' => 'contacts#step_two'
  get 'step_three' => 'contacts#step_three'
  get 'payment' => 'contacts#payment'
  post 'process_payment' => 'contacts#process_payment'
  root 'players#landing'
end
