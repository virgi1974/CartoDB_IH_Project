require './test/test_helper'
require 'rails_helper'
require 'spec_helper'
require 'pry'
class CommentsControllerTest < ActionController::TestCase

  RSpec.describe CommentsController, type: :controller do  

    before(:each) do
      # @user = User.new(
      #   :name => 'virgi',
      #   :email => 'mail_admin@test.com',
      #   :password => 'password_admin',
      #   :password_confirmation => 'password_admin')
      # @user.save
      # @map_1 = Map.create(user_id: 2,table: "ufo",city: "",state: "OR",date1: "2000-01-01 00:00:00",
      # date2: "2015-12-01 00:00:00",shared: true, description: "Oregon from year 2000",created_at: "2015-12-15 17:29:32",updated_at: "2015-12-15 17:29:32",cartodb_username: "") 
    
      # @map_1.comments.create(content: "really good")

      # @user.maps << @map_1

    end

    describe "GET #map_comments" do
      # before(:each) do
      # end

      # it "responds successfully" do
        
      #   get :map_comments, "CommentsController", map_id: @map_1.id
      #   @data = JSON.parse(response.body)
      #   expect(response).to be_success
      #   binding.pry
      # end

      # it "the returned json-info has 3 fields name/email/description" do
      #   expect(@data['content']).to eq('really good')
      # end

      # it "responds successfully with an HTTP 200 status code" do
      #   expect(response).to have_http_status(200)
      # end
      # it 'responds without error' do
      #   expect {@data}.to_not raise_error
      # end
      # it 'responds with JSON' do
      #   expect(response.header['Content-Type']).to include 'application/json'
      # end
      # it "the returned json-maps object has 2 maps" do
      #   @maps = @user.maps
      #   expect(@data.entries.count).to eq(2)
      # end

    end
  end #RSpec
end #CommentsControllerTest
