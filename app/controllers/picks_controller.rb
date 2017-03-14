  class PicksController < ApplicationController
  before_action :find_pick, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.present?
      @picks = current_user.picks
    else
      @picks = Pick.all
    end
  end

  def show

  end

  def new
    @pick = current_user.picks.build
  end

  def create
    @pick = current_user.picks.build(picks_params)

    if @pick.save
      redirect_to "/picks", notice: "This Picks just been created."
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @pick.update(picks_params)
      # Add '5'.to_i points (integer) to pick.score1, if pick.draftee.info == pick.team.draftee.info
        if @pick.draftee.info == @pick.team.draftee.info
          @pick.score1 = '5'.to_i
          @pick.save
        end
      # Add '5'.to_i points (integer) to pick.score2, if pick.second.info == pick.team.second.info
        # if @pick.second.info == @pick.team.second.info
          # @pick.score2 = '5'.to_i
          # @pick.save
      # Add '7.5'.to_i points (float) to pick.bonus, if 'pick.score1'.to_i + 'pick.score2.to_i' == '10'.to_i
        # if @pick.score1 and @pick.score2 == '10'.to_i
          # @pick.bonus = '7.5'.to_i
          # @pick.save
          # notice_message = "You got the bonus!"
        # end
      redirect_to "/picks", notice: "This Pick has been successfully edited."
    else
      render "Edit"
    end
  end

  def destroy
    @pick.destroy
    redirect_to "/picks"
  end


  private

  def picks_params
    params.require(:pick).permit(:round, :number, :team_id, :draftee_id, :order, :second_id, :num2, :actual_id )
  end

  def find_pick
    @pick = Pick.find(params[:id])
  end

end
