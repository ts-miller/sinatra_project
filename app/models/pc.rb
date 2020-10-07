class Pc < ActiveRecord::Base
    belongs_to :user
    has_many :games
    validates_presence_of :cpu_brand, :ram, :gpu_brand, :user_id
end