require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions 

  get '/' do
    erb :index
  end

  post '/names' do
    pp session
    $game = Game.new(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))

    @player_1_name = $game.player_one.name
    @player_2_name = $game.player_two.name

    session[:player_1_name] = @player_1_name
    session[:player_2_name] = @player_2_name
    redirect '/play'
  end
  
  get '/play' do
    @player_1_name = $game.player_one.name
    @player_2_name = $game.player_two.name
    @player_2_hp = $game.player_two.hp

    @message = session[:message]

    erb :play
  end

  post '/attack' do
    @player_1_name = $game.player_one.name
    @player_2_name = $game.player_two.name

    @message = params[:attack]
    session[:message] = @message

    $game.attack($game.player_two)

    redirect '/play'
  end

run! if app_file == $0
end
