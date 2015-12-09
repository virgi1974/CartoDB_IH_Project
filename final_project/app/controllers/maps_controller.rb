require 'pry'

class MapsController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    @maps = @user.maps
    render 'index'
  end

  def show

  end

  def new
    @user = User.find_by(id: params[:user_id])
    @map = @user.maps.new
  end

   def create
    binding.pry
    @user = User.find_by(id: params[:user_id])
    @map = @user.maps.new(entry_params)

     if @map.save
      flash[:notice] = 'Map created successfully!'
      redirect_to action: 'index', controller: 'maps', user_id: @user.id
    else
      # redirect_to action: 'new', controller: 'entries', project_id: project.id
      flash[:alert] = 'Map creation failed!'
      render 'new'
    end

  end

  private
    def entry_params
      params.require(:map).permit(:table, :city, :state, :description, :date1, :date1)
    end

end

  