Rails.application.routes.draw do

  resources :sample, only: [:index, :create]

  # sample実装
  resources :tasks

  # contorller名#メソッド名
  get 'boards', to: 'boards#index'
  get 'boards/new', to: 'boards#new'
  post 'boards', to: 'boards#create'
  get 'boards/:id', to: 'boards#show' 
  
  # namespace 'admin' do
  #   root to: "home#index"
  # end
  
  # route ファイル分離
  # draw :admin

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  # resources :controller名\
  # resources :controller名, only: [:index, :show]

#   resources :tweets
#   $ rake routes

#     Prefix   Verb   URI Pattern                 Controller#Action
#     tweets   GET    /tweets(.:format)           tweets#index
#              POST   /tweets(.:format)           tweets#create   *Laravel でいうstoreにあたる 
#  new_tweet   GET    /tweets/new(.:format)       tweets#new　　　 *Laravel でいうcreate
# edit_tweet   GET    /tweets/:id/edit(.:format)  tweets#edit
#      tweet   GET    /tweets/:id(.:format)       tweets#show
#              PATCH  /tweets/:id(.:format)       tweets#update
#              PUT    /tweets/:id(.:format)       tweets#update
#              DELETE /tweets/:id(.:format)       tweets#destroy

#    resource :tweet
#      Prefix   Verb   URI Pattern            Controller#Action
#   new_tweet   GET    /tweet/new(.:format)   tweets#new
#  edit_tweet   GET    /tweet/edit(.:format)  tweets#edit
#       tweet   GET    /tweet(.:format)       tweets#show
#               PATCH  /tweet(.:format)       tweets#update
#               PUT    /tweet(.:format)       tweets#update
#               DELETE /tweet(.:format)       tweets#destroy
#               POST   /tweet(.:format)       tweets#create

# 違いは以下２点
# ・indexアクションが定義されないこと
# ・URI Patternにidを含まないこと


#  ネスト
# resources :contents do
#   resources :comments
# end

# どのcontentに対してのcommentであるかをルーティングで紐づけることができる。
# $ rake routes
# content_comments  POST  /contents/:content_id/comments(.:format)    comments#create


end
