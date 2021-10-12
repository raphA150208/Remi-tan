Rails.application.routes.draw do
  devise_for :users
  resources :questions
  root 'questions#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

