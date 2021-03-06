class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  def show
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
end
