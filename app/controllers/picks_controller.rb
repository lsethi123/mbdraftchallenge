class PicksController < ApplicationController

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
      redirect_to @pick
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @pick.update(picks_params)
      redirect_to @pick
    end
      render "Edit"
    end
  end

  def destroy

  end

  private

  def picks_params
    params.require(:pick).permit(:round, :number, :team_id)
  end

  def find_pick
    @pick = Pick.find(params[:id])
  end

end
