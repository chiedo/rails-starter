require "rails_helper"

RSpec.describe StaticPagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/").to route_to("static_pages#index")
    end
  end
end
