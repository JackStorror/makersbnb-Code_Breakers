require 'sinatra/base'
require 'sinatra/reloader'
require_relative './model/space_handler'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/add_space' do
    erb :add_space
  end

  post '/add_space' do
    Space_handler.add_space(name: params[:name], description: params[:description], price_per_night: params[:price_per_night])
  end

  get '/display_spaces' do
    @spaces = Space_handler.get_spaces
    erb :display_spaces
  end

  run! if app_file == $0
end