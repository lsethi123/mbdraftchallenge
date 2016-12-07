class Draftee < ActiveRecord::Base
  belongs_to :team
  has_many :picks, through: :team
end
