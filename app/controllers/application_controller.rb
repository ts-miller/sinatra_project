require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/login' do
    if logged_in?
      redirect "/user/#{session[:id]}"
    else
      erb :login
    end
  end

  get '/logout' do
    redirect_if_not_logged_in
    session.clear
    erb :login
  end

  get '/register' do
    if logged_in?
      redirect "/user/#{session[:id]}"
    else
      erb :register
    end
  end

  helpers do

    def logged_in?
      !!session[:username]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        redirect '/login'
      end
    end

  end

end
