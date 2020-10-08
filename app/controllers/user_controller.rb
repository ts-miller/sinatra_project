class UserController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'user/index'
    end

    get '/register' do # '/users/new'
        if logged_in?
          redirect "/user/#{session[:user_id]}"
        else
          erb :'user/register'
        end
    end

    post '/users' do
        if password_match?
            new_user = User.new(name: params[:name], username: params[:username], password: params[:password])
            if new_user.save
                redirect '/login'
            else
                redirect '/failure'
            end
        else
            # flash[:error] = "Passwords did not match."
            redirect '/failure'
        end
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'user/show'
    end

    get '/users/:id/edit' do
        redirect_if_not_owner(User)
        @user = User.find_by_id(params[:id])
        erb :'user/edit'
    end
end