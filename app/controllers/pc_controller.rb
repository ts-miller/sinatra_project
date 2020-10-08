class PcController < ApplicationController

    post '/pcs' do
        pc = Pc.new(params)
        pc.user_id = session[:user_id]
        
        if pc.save
            redirect "/users/#{session[:user_id]}"
        else

            redirect '/failure'
        end
    end

    delete '/pcs/:id' do
        pc = Pc.find_by_id(params[:id])
        pc.destroy
        redirect "/users/#{current_user.id}"
    end

    get '/pcs/new' do
        redirect_if_not_logged_in
        erb :'/pc/new'
    end

    get '/pcs/:id/edit' do
        @pc = Pc.find_by_id(params[:id])
        if @pc.user.id == current_user.id
            erb :'/pc/edit'
        else
            redirect '/failure'
        end
    end
end