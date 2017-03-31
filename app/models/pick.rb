class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :actual
  belongs_to :draftee
  belongs_to :second
  has_one :mypick

  validates :order, :presence => true
  validates :draftee, :presence => true

  validates :order, :uniqueness => { :scope => :user_id}


end
