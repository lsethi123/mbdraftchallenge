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
      redirect_to "/teams/new", notice: "The team's been added! Add More?"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @team.update(teams_params)
      redirect_to :teams
    else
      render "Edit"
    end
  end

  def destroy
    @team.destroy
    redirect_to "/teams"
  end

  private

  def teams_params
    params.require(:team).permit( :name, :city, :notes, :helmet, :drafted, :draftee_id, :second_id )
  end

  def find_team
    @team = Team.find(params[:id])
  end

end
