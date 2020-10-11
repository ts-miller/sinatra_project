class SessionController < ApplicationController

    get '/login' do
        if logged_in?
            flash[:error] = "Ummm, you're already logged in.."
            redirect "/user/#{session[:id]}"
        else
            erb :login
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Successfully logged In"
            redirect "/users/#{current_user.id}"
        else
            flash[:error] = "Username or Password incorrect. Please Try again!"
            redirect '/login'
        end
    end

    get '/logout' do
        redirect_if_not_logged_in
        session.clear
        flash[:success] = "Successfully Logged Out"
        redirect '/login'
    end

    get '/success' do
        erb :success    
    end

    get '/failure' do
        erb :failure
    end

end