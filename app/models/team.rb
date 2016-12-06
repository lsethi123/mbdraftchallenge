class Team < ActiveRecord::Base
  has_many :draftees
  has_many :picks
end
