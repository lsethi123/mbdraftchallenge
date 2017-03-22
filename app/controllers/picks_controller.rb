  class PicksController < ApplicationController
  before_action :find_pick, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.present?
      @picks = current_user.picks.sort_by(&:order)
    else
      @picks = Pick.all
    end
  end

  def show

  end

  def new
    # @pick = current_user.picks.build
    @pick = Pick.new(draftee_id: params[:draftee_id])
  end

  def create
    ## @match = Pick.find({ :order => '@pick.actual.number', :draftee_info => '@pick.actual.draftee_info'})
    # @pick_order_exists = Pick.find_by({ :order => '@pick.order', :user_id => current_user })
    # @pick = Pick.new(pick_params)
    # @pick.user = current_user
    @pick = current_user.picks.build(picks_params)

    # if @pick_order_exists.present?
    #   redirect_to "/picks", notice: "Choose a new pick order. This one's taken."
    # else
        if @pick.save
          redirect_to "/picks", notice: "This Pick's just been created. Picks can be edited below, on this page."
        else
          redirect_to "/picks", alert: "Yo! You've only got 32 picks & can only use each number once. See which picks between 1 and 32 are missing, try the next in the sequence or edit an existing pick."
        end
    # end
  end

  def edit

  end

  def update
    # @bothpicks = @pick.score1 + @pick.score2
    # @match = Pick.find({ :order => 'actual.number', :draftee_id => 'actual.draftee_id'})
    # if @match.present?
      if @pick.update(picks_params)
        # Add '5'.to_i points (integer) to pick.score1, if pick.draftee.info (User's Pick) == pick.team.draftee.info (Team's Actual Pick)
          # if @pick.draftee.info == @pick.team.draftee.info
          #   @pick.score1 = '5'.to_i
          #   @pick.save
          # else
          #   @pick.score1 = '0'.to_i
          #   @pick.save
          # end
        # Add '5'.to_i points (integer) to pick.score1, if pick.order == actual.number.
          # if @pick.order.to_i == @pick.actual.number.to_i
          #   @pick.score1 = '5'.to_i
          #   @pick.save
          # else
          #   @pick.score1 = '0'.to_i
          #   @pick.save
          # end
        # Add '7.5'.to_i points (float) to pick.bonus, if 'pick.score1'.to_i + 'pick.score2.to_i' == '10'.to_i
          # if @pick.score1 + @pick.score2 == '10'.to_i
          #   @pick.bonus = '7.5'.to_f
          #   @pick.total = @pick.score1.to_i + @pick.score2.to_i + @pick.bonus.to_f
          #   @pick.save
          # else
          #   # Add '5'.to_i points (float) to pick.bonus
          #   if @pick.score1 + @pick.score2 == '5'.to_i
          #     @pick.bonus = '3.25'.to_f
          #     @pick.total = @pick.score1.to_i + @pick.score2.to_i + @pick.bonus.to_f
          #     @pick.save
          #   else
          #     # Add '0'.to_i points (float) to pick.bonus
          #     if @pick.score1 + @pick.score2 == '0'.to_i
          #       @pick.bonus = '0.0'.to_f
          #       @pick.total = @pick.score1.to_i + @pick.score2.to_i + @pick.bonus.to_f
          #       @pick.save
          #     end
          #   end
          # end
          redirect_to "/picks", notice: "This Pick has been successfully edited."
      else
        render "Edit"
      end
    # else
    # end
  end

  def destroy
    @pick.destroy
    redirect_to "/picks", notice: "This pick's been successfully deleted."
  end

  private

  def picks_params
    params.require(:pick).permit(:round, :number, :team_id, :draftee_id, :order, :second_id, :num2, :actual_id, :score1, :score2, :bonus, :total )
  end

  def find_pick
    @pick = Pick.find(params[:id])
  end

end
