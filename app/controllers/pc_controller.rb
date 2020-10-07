class PcController < ApplicationController

    get '/pcs' do
        @pcs = Pc.all
        erb :'/pc/index'
    end

    post '/pcs' do
        pc = Pc.new(params)
        pc.user_id = session[:user_id]
        
        if pc.save
            redirect '/success'
        else
            redirect '/failure'
        end
    end

    get '/pcs/new' do
        erb :'/pc/new'
    end

    get '/pcs/:id' do
        @pc = Pc.find_by_id(params[:id])
        erb :'/pc/show'
    end

    get '/pcs/:id/edit' do
        @pc = Pc.find_by_id(params[:id])
        erb :'/pc/edit'
    end

end