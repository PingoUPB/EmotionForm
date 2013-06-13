EmotionForm::Application.routes.draw do
  post "questions/answer"
  resources :questions
  match "report" => 'report#to_csv'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
