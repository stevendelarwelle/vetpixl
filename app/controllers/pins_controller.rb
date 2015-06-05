class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :tagged]
  before_filter :set_search
  def set_search
    @search=Pin.search(params[:q])
  end
  
  def index
    if params[:tag].present?
    @pins = Pin.tagged_with(params[:tag])
    else 
      if params[:user].present?
      @pins = Pin.where(user_id: params[:user])
      else
        if params[:search].present?
          #@pins = Pin.tagged_with(["%#{params[:search]}%"], :any => true)
          @pins = Pin.tagged_with(params[:search], :any => true)
        else
        @pins= Pin.all.order("created_at DESC")
        end
      end
    end
  end
  
  def show
    
  end
  
  def tagged
  if params[:tag].present? 
    @pins = Pin.tagged_with(params[:tag])
  else 
    @pins = Pin.all
  end  
  end
  
  
  def new 
    @pin= current_user.pins.build
  end
  def create
    @pin = current_user.pins.build(pin_params)
    
    if @pin.save
      redirect_to @pin , notice: "Successfully crated new pixl...do a push up."
    else
      render 'new'
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pixl was Updated...Boot!"
    else
      render 'edit'
    end
  end
  def destroy
    @pin.destroy
    redirect_to root_path
  end
  
  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @pin.downvote_from current_user
    redirect_to :back
  end
  
  private
  def pin_params
    params.require(:pin).permit(:title, :description, :image, :tag_list, :user)
  end
  def find_pin
    @pin= Pin.find(params[:id])
  end
  
  
end
