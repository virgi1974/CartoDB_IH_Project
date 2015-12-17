require './test/test_helper'
require 'rails_helper'
require 'spec_helper'
require 'pry'

class MapsControllerTest < ActionController::TestCase

  RSpec.describe MapsController, type: :controller do  

    before(:each) do
      @user = User.new(
        :name => 'virgi',
        :email => 'mail_admin@test.com',
        :password => 'password_admin',
        :password_confirmation => 'password_admin')
      @user.save

      @map_1 = Map.create(id: 57,user_id: 2,table: "ufo",city: "",state: "OR",date1: "2000-01-01 00:00:00",
      date2: "2015-12-01 00:00:00",shared: true, description: "Oregon from year 2000",created_at: "2015-12-15 17:29:32",updated_at: "2015-12-15 17:29:32",cartodb_username: "") 
      @map_2 = Map.create(id: 58,user_id: 2,table: "ufo",city: "",state: "CA",date1: "2000-01-01 00:00:00",
      date2: "2015-12-01 00:00:00",shared: true, description: "Califonia area",created_at: "2015-12-15 17:29:32",updated_at: "2015-12-15 17:29:32",cartodb_username: "") 

      @user.maps << @map_1
      @user.maps << @map_2

    end

    describe "validation of the new-map-form fields" do
      it "fails if description is not filled" do
        expect(Map.new(table: "home", description: "")).to_not be_valid
      end
      it "fails if table-name is not filled" do
        expect(Map.new(table: "", description: "fghgjhjklk")).to_not be_valid
      end
    end

    describe "GET #studycase" do
      before(:each) do
        get :studycase
        expect(response).to be_success
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the studycase template" do
        expect(response).to render_template(:studycase)
      end
    end

    describe "GET #index" do
      before(:each) do
        get :index, "MapsController", user_id: @user.id
        expect(response).to be_success
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
    end

    describe "GET #show_my_maps" do
      before(:each) do
        get :show_my_maps, "MapsController", user_id: @user.id
        expect(response).to be_success
        data = JSON.parse(response.body)
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it 'responds without error' do
        expect {JSON.parse(response.body)}.to_not raise_error
      end
      it 'responds with JSON' do
        expect(response.header['Content-Type']).to include 'application/json'
      end
      it "the returned json-maps object has 2 maps" do
        @maps = @user.maps
        data = JSON.parse(response.body)
        expect(data.entries.count).to eq(2)
      end

    end

    describe "GET #show_selected_map" do
      before(:each) do
        get :show_selected_map, "MapsController", map_id: @map_1.id
        expect(response).to be_success
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it 'responds without error' do
        expect {JSON.parse(response.body)}.to_not raise_error
      end
      it 'responds with JSON' do
        expect(response.header['Content-Type']).to include 'application/json'
      end
      it "the returned json-map has 12 fields" do
        data = JSON.parse(response.body)
        expect(data.entries.count).to eq(12)
      end
    end  

    describe "GET #show_selected_map_info" do
      before(:each) do
        get :show_selected_map_info, "MapsController", map_id: @map_1.id
        expect(response).to be_success
        data = JSON.parse(response.body)
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it 'responds without error' do
        expect {JSON.parse(response.body)}.to_not raise_error
      end
      it 'responds with JSON' do
        expect(response.header['Content-Type']).to include 'application/json'
      end
      it "the returned json-info has 3 fields name/email/description" do
        data = JSON.parse(response.body)
        expect(data['name']).to eq('virgi')
        expect(data['email']).to eq('mail_admin@test.com')
        expect(data['description']).to eq('Oregon from year 2000')
      end
    end

    describe "GET #show_shared_maps" do
      before(:each) do
        get :show_shared_maps
        expect(response).to be_success
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the shared template" do
        expect(response).to render_template(:shared)
      end
    end

    describe "GET #shared_true" do
      before(:each) do
        get :shared_true, "MapsController"
        expect(response).to be_success
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it 'responds without error' do
        expect {JSON.parse(response.body)}.to_not raise_error
      end
      it 'responds with JSON' do
        expect(response.header['Content-Type']).to include 'application/json'
      end
      it "the returned json-maps-obj has 2 maps where 'shared' == true " do
        data = JSON.parse(response.body)
        expect(data.entries.count).to eq(2)
      end
    end

    describe "GET #comments" do
      before(:each) do
        get :comments, "MapsController", map_id: @map_1.id
        expect(response).to be_success
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the comments template" do
        expect(response).to render_template(:comments)
      end
    end

    describe "GET #new" do
      before(:each) do
        get :new, "MapsController", user_id: @user.id
        expect(response).to be_success
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
    end

    # describe "POST #create" do
    #   before(:each) do
    #     post :create, "MapsController", user_id: @user.id
    #     @map = @user.maps.new(description: "none", table: "ufo")
    #     expect(response).to be_success
    #   end

    #   it "responds successfully with an HTTP 200 status code" do
    #     binding.pry
    #     # Map.any_instance.stub(:valid?).and_return(true)
    #     expect(response).to have_http_status(201)
    #   end
    #   # it "creates a successful mesaage post" do
    #   #   @post = Post.create(message: "Message")
    #   #   @post.should be_an_instance_of Post
    #   # end
    # end
   
    
  end #RSpec

end #MapsControllerTest
#render index.html.erb