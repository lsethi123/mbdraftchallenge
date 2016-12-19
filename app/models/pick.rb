class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :draftee
  belongs_to :actual
  belongs_to :second
  has_one :mypick
end
