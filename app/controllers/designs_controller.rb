class DesignsController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :new, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_design, only: [:show, :edit, :update, :destroy]

  def index
    @designs = Design.includes(:user).order("created_at DESC")
    @designs = params[:tag_id].present? ? Tag.find(params[:tag_id]).designs : Design.all.order("created_at DESC")
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(design_params)
    
    if @post_form.save
      redirect_to root_path
      else
        render :new
    end
  end

  def show
   
  end

  def destroy
    design = Design.find(params[:id])
    if design.destroy
      redirect_to root_path
    end
  end

  def update
    design = Design.find(params[:id])
    design.update(design_params)
  end

  def edit
    unless user_signed_in? && current_user.id == @design.user_id
      redirect_to action: :index
    end
  end

  def search
    @designs = Design.search(params[:post][:search]).order("created_at DESC")
  end



  private

  def design_params
    params.require(:post_form).permit(:title, :file_name, :tag_name, :image).merge(user_id: current_user.id)
  end

  def set_design
    @design = Design.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
