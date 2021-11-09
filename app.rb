require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/spaces' do
    p $space_name
    erb :spaces
  end

  get '/spaces/new' do
    erb :space_naming
  end

  post '/spaces/new' do
    p params
    $space_name = params[:space_name]
    redirect '/spaces'
  end

  run! if app_file == $0
end