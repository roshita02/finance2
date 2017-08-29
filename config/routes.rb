Rails.application.routes.draw do
  root 'records#index'
  resources:records
  get 'about' => 'static_pages#about'
end
