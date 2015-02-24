require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views # Necessary to compare the output of the response
  
  # This lazily creates a new user if it is needed
  let :user do
    FactoryGirl.create(:user, email: "bob@bob.com")
  end

  describe "GET #index" do
    before :each do
      # We need to sign in and sign out before each test otherwise devise wil freak out.
      sign_in user
      sign_out user

    end

    it "The user is redirected if not logged in" do
      get :index
      expect(response).to redirect_to :controller => "devise/sessions", :action => "new"
    end

    it "The users email displays if logged in" do
      sign_in user
      get :index

      # Make sure the users email address gets rendered on the page
      expect(response.body.include? "bob@bob.com").to eq true
    end
  end

end
