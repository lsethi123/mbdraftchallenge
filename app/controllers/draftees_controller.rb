class DrafteesController < ApplicationController
  before_action :find_draftee, only: [:show, :edit, :update, :destroy]

  before_action :admin_only, only: [:edit, :update, :destroy]

  def admin_only
    if current_user.email != 'admin@example.com'
      redirect_to :back, notice: "Step off. You are not authorized to do that."
    end
  end

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
    @draftee.destroy
    respond_to do |format|
      format.html { redirect_to draftees_url, notice: 'This Draftee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def draftees_params
    params.require(:draftee).permit( :info, :bio )
  end

  def find_draftee
    @draftee = Draftee.find(params[:id])
  end
end
