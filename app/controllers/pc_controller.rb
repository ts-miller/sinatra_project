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
        erb :'/pc/new'
    end

    get '/pcs/:id/edit' do
        @pc = Pc.find_by_id(params[:id])
        erb :'/pc/edit'
    end
end