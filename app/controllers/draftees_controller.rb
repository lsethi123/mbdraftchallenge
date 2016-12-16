class DrafteesController < ApplicationController
  before_action :find_draftee, only: [:show, :edit, :update, :destroy]

  def index
    @draftees = Draftee.all
  end

  def show

  end

  def new
    @draftee = Draftee.new
  end

  def create
    @draftee = Draftee.new(draftees_params)

    if @draftee.save
      redirect_to @draftee
    else
      render "New"
    end
  end

  def edit

  end

  def update
    if @draftee.update(draftees_params)
      redirect_to @draftee
    else
      render "Edit"
    end
  end

  def destroy

  end

  private

  def draftees_params
    params.require(:draftee).permit( :info, :bio, :info2 )
  end

  def find_draftee
    @draftee = Draftee.find(params[:id])
  end
end
