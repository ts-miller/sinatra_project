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
                flash[:success] = "Account Created. Please log in below."
                redirect '/login'
            else
                flash[:error] = "Username taken. Please choose a unique username."
                redirect '/register'
            end
        else
            flash[:error] = "Passwords did not match."
            redirect '/register'
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
        if !user.pcs.empty?  # Destroys all associated items
            user.pcs.each do |pc|
                if !pc.games.empty?
                    pc.games.each do |game|
                        game.destroy
                    end
                end
                pc.destroy
            end
        end

        user.destroy
        session.clear
        flash[:success] = "Account Successfully deleted."
        redirect "/success"
    end

    patch '/users/:id' do
        user = User.find_by_id(params[:id])
        if user.id == current_user.id
            if params[:old_password] == ""
                user.update(name: params[:name])
                flash[:success] = "Name updated."
                redirect "/users/#{params[:id]}" # Successfully edited name only
            elsif user.authenticate(params[:old_password])
                if password_match?
                    user.name = params[:name]
                    user.password = params[:password]
                    if user.save
                        flash[:success] = "Name and password updated."
                        redirect "/users/#{params[:id]}" # Successfully edited name and password
                    else
                        flash[:error] = "New password not valid."
                        redirect "/users/#{user.id}/edit" # New passwords match but not valid
                    end
                else
                    flash[:error] = "New passwords don't match"
                    redirect "/users/#{user.id}/edit" # New Passwords don't match
                end
            else
                flash[:error] = "Incorrect password"
                redirect "/users/#{user.id}/edit" # Password incorrect
            end
        end
        redirect '/failure' # route doesn't belong to current user
    end
end