class PcController < ApplicationController

    get '/pcs' do
        @pcs = Pc.all
        erb :'/pc/index'
    end

    get '/pc/new' do
        erb :'/pc/new'
    end

    get '/pc/:id' do
        @pc = Pc.find_by_id(params[:id])
        erb :'/pc/show'
    end

    get '/pc/:id/edit' do
        @pc = Pc.find_by_id(params[:id])
        erb :'/pc/edit'
    end
end