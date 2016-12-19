class ActualsController < ApplicationController
  before_action :find_actual, only: [:show, :edit, :update, :destroy]

  def index
    @actuals = Actual.all
  end

  def show

  end

  def new
    @actual = Actual.new
  end

  def create
    @actual = Actual.new(actuals_params)

    if @actual.save
      redirect_to @actual
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @actual.update(actuals_params)
      redirect_to @actual
    else
      render "Edit"
    end
  end

  def destroy

  end

  private

  def actuals_params
    params.require(:actual).permit( :info, :number, :draftee_id )
  end

  def find_actual
    @actual = Actual.find(params[:id])
  end
end
