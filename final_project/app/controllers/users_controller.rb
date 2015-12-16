require 'pry'
class UsersController < ApplicationController
  # before_action :authenticate_user!

  def welcome
    render 'welcome'
  end

  def missing
    render 'missing'
  end

end
