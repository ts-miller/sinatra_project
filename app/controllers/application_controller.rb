require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @games = Game.all
    erb :home
  end

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
      redirect '/success'
    else
      redirect '/failure'
    end
  end

  get '/logout' do
    redirect_if_not_logged_in
    session.clear
    erb :login
  end

  get '/success' do
    erb :success
  end

  get '/failure' do
    erb :failure
  end



  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        redirect '/login'
      end
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def password_match?
      params[:password] == params[:confirm]
    end

  end

end
