require 'sinatra/base'
class Battle < Sinatra::Base
  enable :sessions 
  set :session_secret, "Set session"
  get '/' do
    erb :index
  
  end

  post '/names' do
    p params
    @player_1_name = params[:player_1_name]
    @player_2_name = params[:player_2_name]

    session[:player_1_name] = @player_1_name
    session[:player_2_name] = @player_2_name
    p session
    redirect '/play'
  end
  
  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]

    @message = session[:message]

    erb :play
  end

  post '/attack' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]

    @message = params[:attack]
    session[:message] = @message

    redirect '/play'
  end

run! if app_file == $0
end