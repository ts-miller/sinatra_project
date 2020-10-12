class PcController < ApplicationController

    get '/pcs' do
        @pcs = Pc.all.reverse
        erb :'/pc/index'
    end

    post '/pcs' do
        pc = Pc.new(params)
        pc.user_id = session[:user_id]
        
        if pc.save
            flash[:success] = "Added PC successfully"
            redirect "/users/#{session[:user_id]}"
        else
            flash[:error] = "Make sure all fields are filled out correctly."
            redirect '/pcs/new'
        end
    end

    delete '/pcs/:id' do
        pc = Pc.find_by_id(params[:id])

        if !pc.games.empty? # Delete games associated with PC
            pc.games.each do |game|
                game.destroy
            end
        end
        pc.destroy
        flash[:success] = "PC successfully deleted."
        redirect "/users/#{current_user.id}"
    end

    get '/pcs/new' do
        redirect_if_not_logged_in
        erb :'/pc/new'
    end

    get '/pcs/:id/edit' do
        @pc = Pc.find_by_id(params[:id])
        if @pc.user.id == session[:user_id]
            erb :'/pc/edit'
        else
            redirect '/failure'
        end
    end

    patch '/pcs/:id' do
        params.delete("_method")
        pc = Pc.find_by_id(params[:id])
        if pc.user.id == session[:user_id]
            pc.update(params)
            flash[:success] = "Changes Saved"
        else
            flash[:error] = "You don't own this PC!"
        end
        redirect "/users/#{pc.user.id}"
    end
end