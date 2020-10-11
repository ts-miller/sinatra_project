class User < ActiveRecord::Base
validates_presence_of :username, :name
validates_uniqueness_of :username
has_secure_password
validates :password, length: { in: 6..20}
has_many :pcs
has_many :games, through: :pcs
end