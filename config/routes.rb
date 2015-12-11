Spina::Engine.routes.draw do
  namespace :admin do
    resources :components
  end
end
