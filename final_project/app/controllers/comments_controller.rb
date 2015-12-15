require 'pry'
class CommentsController < ApplicationController

  def index
    
  end

  def map_comments
    @map = Map.find(params[:map_id])
    comments = @map.comments

    @comments = comments.map do |comment|
      {content: comment.content, name: comment.user.name}
    end

    render json: @comments
  end

  def new
    @user = currentuser
    @comment = @user.comments.new()
  end

  def create
    map = Map.find(params[:map_id])
    new_comment = map.comments.new(user_id: params[:user_id],content: params[:comment])

    if new_comment.save
       render json: {content: new_comment.content, name: new_comment.user.name}, status: :created
    else
       render json: new_comment.errors.full_messages,status: :unprocessable_entity
    end

  end

end
