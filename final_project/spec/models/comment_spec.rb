require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  describe "comments relationships" do
    it "should belong to a map" do
      @comment = Comment.reflect_on_association(:map)
      @comment.macro.should == :belongs_to
    end
    it "should belong to a user" do
      @comment = Comment.reflect_on_association(:user)
      @comment.macro.should == :belongs_to
    end
  end
end
