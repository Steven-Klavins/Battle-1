require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions 

  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))
  
    redirect '/play'
  end
  
  get '/play' do
    @game = $game

    @message = session[:message]

    erb :play
  end

  post '/attack' do
    @game = $game

    @message = params[:attack]
    session[:message] = @message

    $game.attack($game.player_two)

    redirect '/play'
  end

run! if app_file == $0
end
