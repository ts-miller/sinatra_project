class UserController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'user/index'
    end

    get '/users/new' do
        erb :'user/new'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'user/show'
    end

    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        erb :'user/edit'
    end
end