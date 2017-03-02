class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :draftee
  belongs_to :actuals
  belongs_to :second
  has_one :mypick

  # def winner
  #   if pick.team.draftee.info == pick.draftee.info
  #     pick.score = '5'.to_i
  #     pick.save
  #     redirect_to :picks, notice: 'Nice Pick!'
  #   end
  # end

end
