Rails.application.routes.draw do
  #verificar se essas rotas estao da melhor maneira possível
  match 'purchase/upload' => 'purchase#upload', :via => :post
  match 'purchase' => 'purchase#index', :via => :get
end
