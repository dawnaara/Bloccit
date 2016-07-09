Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'posts/new'

  get 'posts/show'

  get 'welcome/posts'

  get 'posts/edit'

  get 'posts/destroy'

  root 'welcome#index'
  
end
