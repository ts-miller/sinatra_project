class GameController < ApplicationController

    get '/games' do
        @games = Game.all.reverse
        erb :"/game/index"
    end
    
    post '/games' do
        game = Game.new(params)

        if game.save
            redirect "users/#{session[:user_id]}"
        else
            flash[:error] = "Make sure all fields are filled out."
            redirect '/games/new'
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
            flash[:error] = "You need to add a PC before you can add a benchmark"
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
        @user = User.find_by_id(session[:user_id])
        if @game.pc.user.id == session[:user_id]
            erb :'/game/edit'
        else
            redirect '/failure'
        end
    end

    patch '/games/:id' do
        params.delete("_method")
        game = Game.find_by_id(params[:id])
        if game.pc.user.id == session[:user_id]
            game.update(params)
            flash[:success] = "Changes Saved"
        else
            flash[:error] = "You don't own this game!"
        end
        redirect "/users/#{game.pc.user.id}"
    end
end