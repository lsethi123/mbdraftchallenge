class Actual < ActiveRecord::Base
  belongs_to :team
  has_one :pick
  has_one :mypicks
  belongs_to :draftee
end
