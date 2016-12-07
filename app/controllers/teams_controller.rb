class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show

  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(teams_params)

    if @team.save
      redirect_to @team
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @team.update(teams_params)
      redirect_to @team
    else
      render "Edit"
    end
  end

  def destroy

  end

  private

  def teams_params
    params.require(:team).permit( :name, :city )
  end

  def find_team
    @team = Team.find(params[:id])
  end

end
