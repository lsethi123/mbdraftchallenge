class PicksController < ApplicationController
  before_action :find_pick, only: [:show, :edit, :update, :destroy]

  def index
    @picks = Pick.all

    # if current_user.present?
    #   @picks = current_user.picks
    # else
    #   @picks = Pick.all
    # end
  end

  def show

  end

  def new
    @pick = current_user.picks.build
  end

  def create
    @pick = current_user.picks.build(picks_params)

    if @pick.save
      redirect_to "/picks"
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @pick.update(picks_params)
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
    params.require(:pick).permit(:round, :number, :team_id, :draftee_id, :order )
  end

  def find_pick
    @pick = Pick.find(params[:id])
  end

end
