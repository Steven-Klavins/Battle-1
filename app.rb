require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions 
  set :session_secret, "Set session"

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])

    @player_1_name = $player_1.name
    @player_2_name = $player_2.name

    session[:player_1_name] = @player_1_name
    session[:player_2_name] = @player_2_name
    redirect '/play'
  end
  
  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name

    @message = session[:message]

    erb :play
  end

  post '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name

    @message = params[:attack]
    session[:message] = @message

    redirect '/play'
  end

run! if app_file == $0
end
