class User < ActiveRecord::Base
validates_presence_of :username, :email, :name
has_secure_password
has_many :pcs
has_many :games, through :pcs
end