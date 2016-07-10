Rails.application.routes.draw do
	resources :topics do 
	     resources :posts, except: [:index]
   end

  resources :users, only: [:new, :create]

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
