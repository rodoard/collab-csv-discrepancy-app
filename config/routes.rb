Rails.application.routes.draw do
  root to: 'home#index', as: :home
  post "/data/csv",  to: 'data#csv', as: :upload_csv
end
