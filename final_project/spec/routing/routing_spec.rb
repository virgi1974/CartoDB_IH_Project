require './test/test_helper'
require 'rails_helper'
require 'spec_helper'

RSpec.describe MapsController, type: :routing do

 describe "routing" do

  it "routes to #index" do
    expect(:get => "/users/2/mymaps").to route_to("maps#show_my_maps", :user_id => "2")
  end
  
  it "routes to #show_shared_maps" do
    expect(:get => "shared").to route_to("maps#show_shared_maps")
  end
  
  it "routes to #shared_true" do
    expect(:get => "shared/info").to route_to("maps#shared_true")
  end

  it "routes to #show_selected_map" do
    expect(:get => "/maps/3").to route_to("maps#show_selected_map",:map_id => "3")
  end

  it "routes to #show_selected_map_info" do
    expect(:get => "/maps/5/info").to route_to("maps#show_selected_map_info",:map_id => "5")
  end

  it "routes to #show_selected_map" do
    expect(:get => "shared/4/comments").to route_to("maps#comments",:map_id => "4")
  end

  it "routes to #studycase" do
    expect(:get => "studycase").to route_to("maps#studycase")
  end

 end
end

RSpec.describe CommentsController, type: :routing do

 describe "routing" do

  it "routes to #map_comments" do
    expect(:get => "/comments/2").to route_to("comments#map_comments", :map_id => "2")
  end
  it "routes to #map_comments" do
    expect(:get => "maps/4/comments").to route_to("comments#map_comments", :map_id => "4")
  end
  
 end
end

RSpec.describe UsersController, type: :routing do

 describe "routing" do

  it "routes to #welcome" do
    expect(:get => "/").to route_to("users#welcome")
  end
  
 end
end





