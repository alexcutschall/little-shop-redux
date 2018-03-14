class LittleShopApp < Sinatra::Base
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


  get '/invoices/:id' do
    @invoices = Invoice.find(params[:id])
    erb :'invoices/show'
  end
end
