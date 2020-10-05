class User < ActiveRecord::Base
validates_presence_of :username, :email, :name
validates_uniqueness_of :username
has_secure_password
has_many :pcs
has_many :games, through: :pcs
end