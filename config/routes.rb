Rails.application.routes.draw do
  resources :labels, only: [:show]


	resources :topics do 
	     resources :posts, except: [:index]
   end


  resources :posts, only: [] do
 
  resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end

  #get 'welcome/index'

  #get 'welcome/about'

  #get 'posts/new'

  #get 'posts/show'

  #get 'welcome/posts'

  #get 'posts/edit'

  #get 'posts/destroy'

  #root 'welcome#index'
  
#end
