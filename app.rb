require 'sinatra/base'
require 'sinatra/reloader'
require_relative './model/space_handler'
require 'pg'


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
    Space_handler.add_space(space_name: params[:space_name], space_description: params[:space_description], price_per_night: params[:price_per_night])
    redirect '/display_spaces'
  end

  get '/display_spaces' do
    @spaces = Space_handler.get_spaces
    erb :display_spaces
  end

  run! if app_file == $0
end