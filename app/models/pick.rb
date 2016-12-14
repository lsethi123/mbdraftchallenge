class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :draftee
  has_one :mypick
end
