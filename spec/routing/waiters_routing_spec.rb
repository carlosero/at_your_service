require "rails_helper"

RSpec.describe WaitersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/waiters").to route_to("waiters#index")
    end

    it "routes to #new" do
      expect(:get => "/waiters/new").to route_to("waiters#new")
    end

    it "routes to #show" do
      expect(:get => "/waiters/1").to route_to("waiters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/waiters/1/edit").to route_to("waiters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/waiters").to route_to("waiters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/waiters/1").to route_to("waiters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/waiters/1").to route_to("waiters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/waiters/1").to route_to("waiters#destroy", :id => "1")
    end

  end
end
