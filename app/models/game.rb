class Game < ActiveRecord::Base
    belongs_to :pc
    validates_presence_of :name, :avg_fps
end