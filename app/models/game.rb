class Game < ActiveRecord::Base
    validates_presence_of :name, :avg_fps
    belongs_to :pc
end