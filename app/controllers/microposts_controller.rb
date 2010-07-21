class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end
  def show
    @micropost = Micropost.find(params[:id])
  end
  def new
    @micropost = Micropost.new
    @users = User.all
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
    @micropost = Micropost.find(params[:id])
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
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to microposts_path
  end
end