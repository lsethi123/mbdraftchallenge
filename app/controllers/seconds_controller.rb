class SecondsController < ApplicationController
  before_action :find_second, only: [:show, :edit, :update, :destroy]

  def index
    @seconds = Second.all
  end

  def show

  end

  def new
    @second = Second.new
  end

  def create
    @second = Second.new(seconds_params)

    if @second.save
      redirect_to @second
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @second.update(seconds_params)
      redirect_to @second
    else
      render "Edit"
    end
  end

  def destroy

  end

  private

  def seconds_params
    params.require(:second).permit( :info, :bio )
  end

  def find_second
    @second = Second.find(params[:id])
  end
end
