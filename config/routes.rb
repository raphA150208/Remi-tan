Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :questions do
    resources :answers
  end
  root 'questions#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :reminiscent_words_dictionaries do
    collection do
      get 'search'
    end
  end
end

