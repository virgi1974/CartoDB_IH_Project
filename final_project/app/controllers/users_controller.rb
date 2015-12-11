require 'pry'
class UsersController < ApplicationController
  # before_action :authenticate_user!


  def welcome
    render 'welcome'
  end

  def missing
    render 'missing'
  end

  def show
    @user = User.find_by(id: params[:id])
    @maps = @user.maps
  end

  




end
