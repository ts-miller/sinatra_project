class SessionController < ApplicationController

    get '/login' do
        if logged_in?
            redirect "/user/#{session[:id]}"
        else
            erb :login
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{current_user.id}"
        else
            failed_login
            redirect '/failure'
        end
    end

    get '/logout' do
        redirect_if_not_logged_in
        session.clear
        redirect '/login'
    end

    get '/success' do
        erb :success    
    end

    get '/failure' do
        erb :failure
    end

end