require 'sinatra/base'
require 'sinatra/reloader'
require_relative './model/space_handler'
require 'pg'
require_relative './model/user'


class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user_name = User.get_user_name
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

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.create_user(user_name: params[:user_name], password: params[:password])
    redirect '/'
  end

  run! if app_file == $0
end