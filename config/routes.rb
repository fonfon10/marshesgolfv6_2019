Rails.application.routes.draw do
#  resources :open_closes
#  resources :days
#  resources :reservations
#  resources :activities
#  resources :timeslots
#  devise_for :members
#  resources :memberships
#  resources :age_groups
#
#
#  
#  resources :members
#  devise_for :admin_users, ActiveAdmin::Devise.config
#  ActiveAdmin.routes(self)
#  devise_for :admins
#  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#
#
#  root to: "memberships#index"



  resources :dashboard
  resources :open_closes
  resources :days do
    member do 
      get 'toggle_open_close_status'
    end
  end

  resources :reservations do
      member do
        get 'book_lesson'
        get 'book_practice'
        get 'cancel'
      end
    end
  
  




  get 'calendar/index'

  resources :activities
  resources :timeslots
  resources :memberships do
      member do
        get 'membership_to_operator'
        get 'membership_to_coaching'
        get 'membership_to_practice'
        get 'membership_to_admin'
      end
    end



  resources :age_groups


  devise_for :members
  resources :members
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "days#index"



end
