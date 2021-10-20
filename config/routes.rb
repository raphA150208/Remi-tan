Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  resources :users, only: [:show]
  resources :questions do
    resources :answers, only: [:new, :create, :edit, :destroy, :update] do
      resources :answer_words, only: [:create]
    end
  end

  root 'tops#top'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get 'search', to: 'reminiscent_words_dictionaries#search'
  get 'result', to: 'questions#result'
  post 'questions/:id/answers/new', to: 'answers#create'
end

