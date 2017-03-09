class Actual < ActiveRecord::Base
  belongs_to :team
  has_one :pick
  has_one :mypick
  belongs_to :draftee
end
