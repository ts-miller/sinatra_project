class GameController < ApplicationController

    post '/games' do
        game = Game.new(params)

        if game.save
            redirect "users/#{session[:user_id]}"
        else
            redirect '/failure'
        end
    end

    delete '/games/:id' do
        game = Game.find_by_id(params[:id])
        game.destroy
        redirect "/users/#{session[:user_id]}"
    end

    get '/games/new' do
        redirect_if_not_logged_in
        @user = User.find_by_id(session[:user_id])
        if @user.pcs.empty?
            redirect '/pcs/new'
        else
            erb :'/game/new'
        end
    end

    get '/games/:id' do
        @games = Game.find_by(name: params[:id])
        erb :'/game/show'
    end

    get '/games/:id/edit' do
        @game = Game.find_by_id(params[:id])
        @user = User.find_by_id(current_user.id)
        if @game.pc.user.id == current_user.id
            erb :'/game/edit'
        else
            redirect '/failure'
        end
    end

    patch '/games/:id' do
        params.delete("_method")
        game = Game.find_by_id(params[:id])
        if game.pc.user.id == current_user.id
            game.update(params)
        end
        redirect "/users/#{game.pc.user.id}"
    end
end