require './test/test_helper'
require 'rails_helper'
require 'spec_helper'

class MapTest < ActiveSupport::TestCase
 
  RSpec.describe Map, type: :model do   

    describe "validation of the new-map-form fields" do
      it "fails if neither table or description are given" do
        expect(Map.new()).to_not be_valid
      end
      it "fails if description is not filled" do
        expect(Map.new(table: "home", description: "")).to_not be_valid
      end
      it "fails if table-name is not filled" do
        expect(Map.new(table: "", description: "fghgjhjklk")).to_not be_valid
      end
      it "it passes when both fields are filled" do
        expect(Map.new(table: "whatever", description: "whatever")).to be_valid
      end
    end

    describe "map relations" do
      it "should have many comments" do
        @map = Map.reflect_on_association(:comments)
        @map.macro.should == :has_many
      end
      it "should have belong to a user" do
        @map = Map.reflect_on_association(:user)
        @map.macro.should == :belongs_to
      end
    end

    describe "#to_custom_hash" do
      it "returns a hash with values for email-name-description" do
        @user = User.create(email: "virgi@yahoo", name: "toni")
        @map = Map.create(table: "ufo", description: "great")
        @user.maps << @map
        expect(@map.to_custom_hash).to eq({email: 'virgi@yahoo', name: 'toni',description: 'great'}) 
      end
      
    end
    
  end #RSpec

end #MapTest

# rspec test/models/map_test.rb 
