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

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        # message - you need to log in
        redirect '/login'
      end
    end

    def redirect_if_not_owner(model_class)
      redirect_if_not_logged_in
      if model_class != User
        owner = model_class.find_by_id(params[:id]).user
        binding.pry
        if current_user.id != owner.id
          # message - you are not the owner
          redirect '/failure'
        end
      elsif current_user != model_class.find_by_id(params[:id])
        # message - You are not the owner
        redirect '/failure'
      end
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def password_match?
      params[:password] == params[:confirm]
    end

    def power_supplies
      psus = ["AMD", "Antec", "Apevia", "ApexGaming", "Argon", "Forty", "ASUS", "AVAWO", "be", 
      "quiet", "Cable", "Matters", "CableMod", "COMeap", "Cooler", "Master", "Coolmax", "Corsair", 
      "Dell", "ElectronicsSalon", "eTopxizu", "EVGA", "EZDIYFAB", "FOR", "DELL", "Fuhengli", 
      "GAMEMAX", "Gigabyte", "HP", "inShareplus", "LABISTS", "MEAN", "WELL", "MEISHILE", "Microsoft", 
      "Montech", "NZXT", "Odyson", "Optimal", "Shop", "Padarsey", "Phanteks", "Pig", "Hog", "POINWER",
       "Raspberry", "RetroArcadeus", "SUnion", "Seasonic", "Siglent", "Technologies", "SilverStone", 
       "Technology", "StarTech", "SUPER", "FLOWER", "Super", "Flower", "SUPERNIGHT", "Thermaltake", 
       "Traxxas", "Treedix", "YEECHUN"]
    end

    def multiple_pcs?(output=nil)
      if output
        if @user.pcs.count > 1
          output
        end
      else
        @user.pcs.count > 1
      end
    end

  end

end
