require 'pry'
class CommentsController < ApplicationController

  def index
    @maps = Map.all.where('shared = ?', true)
    render json: @maps
  end

# User.first.maps.first.comments.first.content !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
def shared_comments
    @maps = Map.all.where('shared = ?', true)
    @comment = Comment.new
    # # @comments = @maps.comments
    render json: @maps
    # render 'shared'
    # binding.pry
end



end
