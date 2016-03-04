class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :main
  before_action :authenticate_user!, except: :main

  def show
    @user = User.find(params[:id])
    @items = Item.all
  end

  def main
    render layout: 'main_page'
  end
  def clients ;  end
  def managers ; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to managers_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :type, :first_name, :last_name)
  end
end
