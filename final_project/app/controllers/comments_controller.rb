class CommentsController < ApplicationController

  def index
    @maps = Map.all.where('shared = ?', true)
    render json: @maps
  end
end
