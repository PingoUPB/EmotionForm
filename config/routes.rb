EmotionForm::Application.routes.draw do
  post "questions/answer"
  resources :questions

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
