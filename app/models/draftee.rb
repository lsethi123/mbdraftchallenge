class Draftee < ActiveRecord::Base
  # belongs_to :team
  has_one :pick
  has_one :mypick
  has_one :actual
  has_one :team

  validates :info, :presence => true
end
