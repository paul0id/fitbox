class UsersController < ApplicationController
  before_action :authenticate_user!, except: :main

  def show
    @user = User.find(params[:id])
  end

  def main
  end

  def index
    @users = User.where(type: 'Client')
  end
end
