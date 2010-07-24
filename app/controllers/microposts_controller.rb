class MicropostsController < ApplicationController
  before_filter :find_micropost, :only => [:show, :edit, :update, :destroy]
  before_filter :find_users, :only => [:create, :edit, :new, :update]
  
  def index
    @microposts = Micropost.all
  end
  def show
  end
  def new
    @micropost = Micropost.new
    if @users.empty?
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
  
  def find_users
    @users = User.all
  end

end