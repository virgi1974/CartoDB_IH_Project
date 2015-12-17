require './test/test_helper'
require 'rails_helper'
require 'spec_helper'
require 'pry'

class UsersControllerTest < ActionController::TestCase

   RSpec.describe UsersController, type: :controller do  

    describe "GET #welcome" do
      before(:each) do
        get :welcome
      end
      it "responds successfully" do
        expect(response).to be_success
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the welcome template" do
        expect(response).to render_template(:welcome)
      end
    end

  end #RSpec
end #UsersControllerTest
