class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :actual
  belongs_to :draftee
  belongs_to :second
  has_one :mypick

  # validates :number, :uniqueness => true
  validates :order, :uniqueness => { :scope => :user_id}
  # validates :team_id, :uniqueness => true
  # validates :draftee_id, :uniqueness => true
  # validates :second_id, :uniqueness => true

  # def winner
  #   if pick.team.draftee.info == pick.draftee.info
  #     pick.score = '5'.to_i
  #     pick.save
  #     redirect_to :picks, notice: 'Nice Pick!'
  #   end
  # end

end
