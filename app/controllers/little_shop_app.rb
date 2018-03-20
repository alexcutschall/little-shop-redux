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

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    erb :'merchants/merchants-dashboard'
  end

  put '/merchants/:id' do |id|
    merchant = Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{merchant.id}"
  end

  post '/merchants' do
  	merchant = Merchant.create(params[:merchant])
  	redirect "/merchants/#{merchant.id}"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/show'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/edit'
  end

  put '/invoices/:id' do |id|
    invoice = Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{invoice.id}"
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    invoice_items = InvoiceItem.where(invoice_id: id)
    invoice_items.each(&:destroy)
    redirect '/invoices'
  end

  get '/invoices-dashboard' do
    @invoices = Invoice.all
    erb :'invoices/invoices-dashboard'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'items/new'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    erb :'items/edit'
  end

  post '/items' do
    item = Item.create(params[:item])
    redirect :'/items'
  end

  put '/items/:id' do |id|
    item = Item.update(id.to_i, params[:item])
    redirect "/items/#{item.id}"
  end

  delete '/items' do |id|
    item = Item.destroy(id.to_i)
    redirect '/items'
  end
end
