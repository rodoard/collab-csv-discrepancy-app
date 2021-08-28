Rails.application.routes.draw do
  post "/data/csv",  to: 'data#csv'
end
