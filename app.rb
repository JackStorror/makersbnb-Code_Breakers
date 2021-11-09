require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require_relative './model/database'

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
    userstory_6_add_desc/ppn
    Database.add_space(name: params[:name], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/display_spaces'
  end

  get '/display_spaces' do
    @spaces = Database.get_spaces
    erb :display_spaces
  end

  run! if app_file == $0
end