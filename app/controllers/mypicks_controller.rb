class MypicksController < ApplicationController
  before_action :find_mypick, only: [:show, :edit, :update, :destroy]

  def index
    @mypick = Mypick.new

    if current_user.present?
      @mypicks = current_user.mypicks
    else
      @mypicks = Mypick.all
    end
  end

  def show

  end

  # new_mypick GET    /mypicks/new(.:format)         mypicks#new
  def new
    @mypick = Mypick.new(pick_id: params[:pick_id])
    @mypick.user = current_user
    @mypick.save
    redirect_to :mypicks, notice: "This pick's been added to your draft board!"
  end

  def create
    @mypick = current_user.mypicks.build(mypick_params)
    # @mypick = Mypick.new(mypick_params)

    respond_to do |format|
      if @mypick.save
        format.html { redirect_to "/mypicks", notice: 'The pick was added to your draft board.' }
      else
        render "new"
      end
    end
  end

  def edit

  end

  def update
    @mypick = Mypick.new(pick_id: params[:pick_id])
   respond_to do |format|
      if @mypick.update(mypick_params)
        redirect_to "/mypicks", notice: "This (My)Pick has been successfully updated."
      else
        render "Edit"
      end
    end
  end


  def destroy

  end

  private
    def mypick_params
      params.require(:mypick).permit(:pick_id)
    end

    def find_mypick
      @mypick = Mypick.find(params[:id])
    end

end
