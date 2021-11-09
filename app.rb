require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/add_space' do 
    erb :add_space
  end 

  post '/add_space' do 
    Database.add_space(name: params[:space_name] )
  end 

  run! if app_file == $0
end