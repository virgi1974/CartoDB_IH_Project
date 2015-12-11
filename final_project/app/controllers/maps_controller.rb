require 'pry'

class MapsController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    @maps = @user.maps
    # render json: @maps
    render 'index'
  end

  def show_my_maps
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    @maps = @user.maps
    render json: @maps
    # redirect_to action: 'index', controller: 'maps', user_id: @user.id
  end
  

  def show_selected_map
    binding.pry
    @map = Map.find_by(id: params[:map_id])
    render json: @map
  end


  def new
    @user = User.find_by(id: params[:user_id])
    @map = @user.maps.new
  end

  def create
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
      params.require(:map).permit(:table, :city, :state, :description, :date1, :date2, :cartodb_username)
    end

end

  