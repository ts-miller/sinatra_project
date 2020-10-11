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
            flash[:error] = "Passwords did not match."
            redirect '/failure'
        end
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'user/show'
    end

    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        if @user.id == current_user.id
            erb :'/user/edit'
        else
            redirect '/failure'
        end
    end

    delete '/users/:id' do
        user = User.find_by_id(params[:id])
        user.destroy
        redirect "/success"
    end

    patch '/users/:id' do
        user = User.find_by_id(params[:id])
        if user.id == current_user.id
            if params[:old_password] == ""
                user.update(name: params[:name])
                redirect "/users/#{params[:id]}" # Successfully edited name only
            elsif user.authenticate(params[:old_password])
                if password_match?
                    user.name = params[:name]
                    user.password = params[:password]
                    if user.save
                        redirect "/users/#{params[:id]}" # Successfully edited name and password
                    else
                        redirect '/failure' # New passwords match but not valid
                    end
                else
                    redirect '/failure' # New Passwords don't match
                end
            else
                redirect '/failure' # Password incorrect
            end
        end
        redirect '/failure' # route doesn't belong to current user
    end
end