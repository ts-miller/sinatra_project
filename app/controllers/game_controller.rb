class GameController < ApplicationController

    get '/games' do
        @games = Game.all
        erb :'/game/index'
    end

    get '/games/new' do
        erb :'/game/new'
    end

    get '/games/:id' do
        @game = Game.find_by_id(params[:id])
        erb :'/game/show'
    end

    get '/games/:id/edit' do
        @game = Game.find_by_id(params[:id])
        erb :'/game/edit'
    end
end