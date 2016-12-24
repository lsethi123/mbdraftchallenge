class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :draftee
  belongs_to :actuals
  belongs_to :second
  has_one :mypick

  def winner
    # @w = Actual.find_by({ order: 'actual.number', team_id: 'actual.team_id', draftee_id: 'actual.draftee_id' })
    @actual = Actual.find_by( :number => 'pick.order', :team_id => 'pick.team_id', :draftee_id => 'pick.draftee_id' )
  end
end
