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
    #@pick = current_user.picks.build
    if current_user.picks.count < '32'.to_i
      @pick = Pick.new(draftee_id: params[:draftee_id])
    else
      redirect_to "/picks", alert: "You've maxed out on Picks! Check your board and edit picks to lock in any changes."
    end
  end

  def create
    @pick = current_user.picks.build(picks_params)
      if @pick.save
        redirect_to "/picks", notice: "This Pick's just been created. Picks can be edited below, on this page."
      else
        redirect_to "/picks", alert: "Seems you've tried to use a number more than once. See which picks between 1 and 32 are missing. Try the next in the sequence or edit an existing pick."
      end
  end

  def edit

  end

  def number_of_matches arr
    arr.count do |e|
      e == 'true'
    end
  end

  def update
    @match = Actual.find_by({ :number => @pick.order, :draftee_id => @pick.draftee_id })
    if @pick.update(picks_params)
      # Add '5'.to_i points (integer) to pick.score1, if pick.draftee.info (User's Pick) == pick.team.draftee.info (Team's Actual Pick)
        # if @pick.draftee.info == @pick.team.draftee_ide.info
        #   @pick.score1 = '5'.to_i
        #   @pick.save
        # else
        #   @pick.score1 = '0'.to_i
        #   @pick.save
        # end
      # Add '5'.to_i points (integer) to pick.score1, if pick.order == actual.number.
        # if @pick.order.to_i == @actual.number.to_i
        #   @pick.score1 = '5'.to_i
        #   @pick.save
        # else
        #   @pick.score1 = '0'.to_i
        #   @pick.save
        # end

      # Add '5'.to_i points (integer) to pick.score1, if pick.order == actual.number.
        if @match.present?
          @pick.score1 = '5'.to_i
          # picks.total = @total + '5'.to_i
          @pick.save
          # @total.save
        else
          @pick.score1 = '0'.to_i
          @pick.save
        end

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
