class UsersController < ApplicationController
  before_action :authenticate_user!, except: :main

  def show
    @user = User.find(params[:id])
    @items = Item.all
  end

  def main
  end

  def index
    @users = User.where(type: 'Client')
  end
end
