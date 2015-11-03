Rails.application.routes.draw do

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "home#index"

  get "/report" => "reports#report", as: :report
  
  resources :categories, except: [ :show ]
  resources :expenses,   except: [ :show ]
  resources :incomes,    except: [ :show ]
  
end
