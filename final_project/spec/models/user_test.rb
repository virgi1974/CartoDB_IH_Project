require './test/test_helper'
require 'rails_helper'
require 'spec_helper'

class UserTest < ActiveSupport::TestCase

  RSpec.describe User, type: :model do   

    # before :each do
    #   @map = User.new
    # end 

    describe "validation of the user-name" do
      it "fails if description is not filled" do
        expect(User.new(name: "")).to_not be_valid
      end
    end

  describe "user relations" do
    it "should have many maps" do
      @user = User.reflect_on_association(:maps)
      @user.macro.should == :has_many
    end

    it "should have many comments" do
      @user = User.reflect_on_association(:comments)
      @user.macro.should == :has_many
    end
  end
    
  end

end


