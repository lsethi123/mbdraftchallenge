class Pick < ActiveRecord::Base
  belongs_to :team
  has_one :draftee, through: :team
end
