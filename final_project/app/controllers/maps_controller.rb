require 'pry'

class MapsController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    @maps = @user.maps
    render 'index'
  end

  def show_my_maps
    @user = User.find_by(id: params[:user_id])
    @maps = @user.maps
    render json: @maps
  end
  

  def show_selected_map
    @map = Map.find_by(id: params[:map_id])
    render json: @map
  end

  def show_selected_map_info
    @map = Map.find_by(id: params[:map_id])
    render json: {email: @map.user.email, name: @map.user.name,description: @map.description}, status: :created
  end


  def show_shared_maps
    @comment = Comment.new
    render 'shared'
  end

  def shared_true
    @maps = Map.all.where('shared = ?', true)
    @comment = Comment.new
    render json: @maps
  end

  def comments
    render 'comments'
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
      flash[:alert] = 'Map creation failed!'
      render 'new'
    end
  end

  def studycase
    render 'studycase'
  end

  private
    def entry_params
      params.require(:map).permit(:table, :city, :state, :description, :date1, :date2, :cartodb_username)
    end

end

  