Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :questions do
    resources :answers
  end
  root 'tops#top'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get 'search', to: 'reminiscent_words_dictionaries#search'
end

