class UserController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'user/index'
    end

    get '/register' do
        if logged_in?
          redirect "/user/#{session[:user_id]}"
        else
          erb :'user/register'
        end
    end

    post '/users' do
        if password_match?
            new_user = User.create(name: params[:name], username: params[:username], password: params[:password])
            session[:user_id] = new_user.id
            redirect '/'
        else
            # flash[:error] = "Passwords did not match."
            redirect '/register'
        end
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