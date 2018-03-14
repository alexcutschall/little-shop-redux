class LittleShopApp < Sinatra::Base
  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end
end
