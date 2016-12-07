class Draftee < ActiveRecord::Base
  belongs_to :team
  has_one :pick
end
