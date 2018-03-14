class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end
<<<<<<< HEAD
=======

>>>>>>> d1bd3b769f242b1fc7ad9d1107e523756e380310

  get '/invoices/:id' do
    @invoices = Invoice.find(params[:id])
    erb :'invoices/show'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end
end
