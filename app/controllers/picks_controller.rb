class PicksController < ApplicationController
  before_action :find_pick, only: [:show, :edit, :update, :destroy]

  def index
    @picks = Pick.all
  end

  def show

  end

  def new
    @pick = Pick.new
  end

  def create
    @pick = Pick.new(picks_params)

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
      redirect_to "/picks"
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
    params.require(:pick).permit(:round, :number, :team_id, :draftee_id)
  end

  def find_pick
    @pick = Pick.find(params[:id])
  end

end
