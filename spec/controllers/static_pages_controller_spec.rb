require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  # This lazily creates a new user if it is needed. If you don't get what "let" does, then do some Googling
  let :user do
    FactoryGirl.create(:user, email: "bob@bob.com")
  end

  describe "GET #index" do
    before :each do
      # We need to sign in and sign out before each test otherwise devise wil freak out since this page is authenticated. I'm assuming this sets up some needed session data, etc
      sign_in user
      sign_out user
    end

    it "The user is redirected if not logged in" do
      get :index
      expect(response).to redirect_to :controller => "devise/sessions", :action => "new"
    end

    it "The Login status is correctly updated if the user is logged in" do
      sign_in user
      get :index

      # Make sure the users email address gets rendered on the page
      expect(assigns(:login_status)).to eq "Logged In User"
    end
  end

end
