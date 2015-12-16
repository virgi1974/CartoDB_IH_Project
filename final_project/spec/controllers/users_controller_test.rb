require './test/test_helper'
require 'rails_helper'
require 'spec_helper'
require 'pry'

class UsersControllerTest < ActionController::TestCase

   RSpec.describe UsersController, type: :controller do  

    # before(:each) do
    #   @user = User.new(
    #     :name => 'virgi',
    #     :email => 'mail_admin@test.com',
    #     :password => 'password_admin',
    #     :password_confirmation => 'password_admin')
    #   @user.save

    #   @map_1 = Map.create(id: 57,user_id: 2,table: "ufo",city: "",state: "OR",date1: "2000-01-01 00:00:00",
    #   date2: "2015-12-01 00:00:00",shared: true, description: "Oregon from year 2000",created_at: "2015-12-15 17:29:32",updated_at: "2015-12-15 17:29:32",cartodb_username: "") 
    #   @map_2 = Map.create(id: 58,user_id: 2,table: "ufo",city: "",state: "CA",date1: "2000-01-01 00:00:00",
    #   date2: "2015-12-01 00:00:00",shared: true, description: "Califonia area",created_at: "2015-12-15 17:29:32",updated_at: "2015-12-15 17:29:32",cartodb_username: "") 

    #   @user.maps << @map_1
    #   @user.maps << @map_2

    # end

    describe "GET #welcome" do
      before(:each) do
        get :welcome
        expect(response).to be_success
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the welcome template" do
        expect(response).to render_template(:welcome)
      end
    end

    # def show
    #   @user = User.find_by(id: params[:id])
    #   @maps = @user.maps
    # end

    # describe "GET #show" do
    #   before(:each) do
    #     get :show, "MapsController", user_id: @user.id
    #     expect(response).to be_success
    #   end

    #   it "renders the index template" do
    #     expect(response).to render_template(:index)
    #   end
    #   it "responds successfully with an HTTP 200 status code" do
    #     expect(response).to have_http_status(200)
    #   end
    # end









    # describe "validation of the new-map-form fields" do
    #   it "fails if description is not filled" do
    #     expect(Map.new(table: "home", description: "")).to_not be_valid
    #   end
    #   it "fails if table-name is not filled" do
    #     expect(Map.new(table: "", description: "fghgjhjklk")).to_not be_valid
    #   end
    # end


    # describe "GET #index" do
    #   before(:each) do
    #     get :index, "MapsController", user_id: @user.id
    #     expect(response).to be_success
    #   end

    #   it "renders the index template" do
    #     expect(response).to render_template(:index)
    #   end
    #   it "responds successfully with an HTTP 200 status code" do
    #     expect(response).to have_http_status(200)
    #   end
    # end

  end #RSpec
end #UsersControllerTest






 

#render index.html.erb