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

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    merchant = Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{merchant.id}"
  end

  post '/merchants' do
  	merchant = Merchant.create(params[:merchant])
  	redirect "/merchants/#{merchant.id}"
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/:id' do
    @invoices = Invoice.find(params[:id])
    erb :'invoices/show'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

end
