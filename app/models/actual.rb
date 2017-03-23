class Actual < ActiveRecord::Base
  has_many :picks
  belongs_to :team
  has_one :mypick
  belongs_to :draftee

  validates :draftee_id, :presence => true
  validates :number, :presence => true
end
