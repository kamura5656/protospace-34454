class PrototypesController < ApplicationController
  before_action :params_find, except: [:index, :new, :create, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index,      only: [:edit]


  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.save
      redirect_to edit_prototype_path
    else
      render :edit
    end  
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def params_find
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless  current_user.id == @prototype.user_id 
      redirect_to action: :index
    end
  end
end