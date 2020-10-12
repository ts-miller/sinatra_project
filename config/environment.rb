ENV['SINATRA_ENV'] ||= "production"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
end

configure :production do
  db = URI.parse(ENV['HEROKU_POSTGRESQL_COBALT_URL'] || 'postgres://ddpxfjbcsfekhj:f160331218ad9beb929198c76088d169636c4d92244ab5d52691224e232b475e@ec2-50-17-197-184.compute-1.amazonaws.com:5432/dfqtsi981sjfre')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

require './app/controllers/application_controller'
require_all 'app'
require 'pry'
require 'sinatra/flash'
