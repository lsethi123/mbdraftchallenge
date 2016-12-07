class Team < ActiveRecord::Base
  has_many :picks
  has_many :draftees
end
