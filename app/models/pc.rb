class Pc < ActiveRecord::Base
    validates_presence_of :cpu_brand, :ram, :gpu_brand
    belongs_to :user
    has_many :games
end