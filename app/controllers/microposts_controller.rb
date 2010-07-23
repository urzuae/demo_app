class MicropostsController < ApplicationController
  before_filter :find_micropost, :only => [:show, :edit, :update, :destroy]
  
  def index
    @microposts = Micropost.all
    @tags = Micropost.tag_counts_on(:tags)
  end
  def show
  end
  def new
    @micropost = Micropost.new
    @users = User.all
    if @users.empty?
      flash[:notice] = 'Create a user first'
      redirect_to new_user_path
    end
  end
  def create
    @micropost = Micropost.new(params[:micropost])
    if @micropost.save
      redirect_to @micropost
    else
      render 'new'
    end
  end
  def edit
    @users = User.all
  end
  def update
    if @micropost.update_attributes(params[:micropost])
      redirect_to @micropost
    else
      render 'edit'
    end
  end
  def destroy
    @micropost.destroy
    redirect_to microposts_path
  end
  
  def tag
    @microposts = Micropost.tagged_with(params[:id])
  end
  
  private
  
  def find_micropost
    @micropost = Micropost.find(params[:id])
  end
  

end