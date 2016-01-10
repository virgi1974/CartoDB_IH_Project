require 'pry'
class UsersController < ApplicationController

  def welcome
    render 'welcome'
  end

  def missing
    render 'missing'
  end

end
