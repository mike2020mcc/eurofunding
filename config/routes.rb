Rails.application.routes.draw do

  namespace :about  do
    get '', action: :index
    get 'team', action: :team
  end

  namespace :expertise do
    get '', action: :index
    get 'financial-planning', action: :financial
    get 'retirement-planning', action: :retirement
    get 'protection-advice', action: :protection
    get 'mortgage-advice', action: :mortgage
    get 'will-and-trust-advice', action: :will_trust
  end

  namespace :services do
    get 'remittances', action: :remittances
    get 'banking', action: :banking
  end

  namespace :users do
    post '', action: :create

  end

  resources :sessions, only: :create
  get 'logout', to: 'sessions#destroy'

  get 'contact', to: 'contact#index'

  get 'account', to: 'account#index'

  post '/email', to: 'email#deliver', as: 'email_deliver'

  get 'OneSignalSDKWorker.js', to: 'one_signal#worker'
  get 'OneSignalSDKUpdaterWorker.js', to: 'one_signal#worker'

  get 'cookies', to: 'cookies#index'

  namespace :admin, path: '_admin' do
    get '', to: redirect('/_admin/sections')
    resources :sections, only: [:index, :show, :destroy] do
      resources :groups, only: [:index, :show, :destroy] do
        resources :snippets, only: [:index, :edit, :update, :destroy]
      end
    end
  end


  post '/callback', to: 'callback#index'
  root to: 'home#index'

  %w(404 500).each do |code|
    get code, to: 'errors#show', code: code
  end


  
end
