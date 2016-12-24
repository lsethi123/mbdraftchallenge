class Draftee < ActiveRecord::Base
  # belongs_to :team
  has_one :pick
  has_one :mypicks
  has_one :actual
  has_one :team
end
