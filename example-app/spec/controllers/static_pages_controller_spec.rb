require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views # Necessary to compare the output of the response

  let(:invalid_attributes) { {} }

  let(:valid_session) { {} }

  # Runs before each test.
  before do
    # Sign in as a user.
    # sign_in_as_a_valid_user
  end

  describe "GET #index" do
    it "The user is not permitted without logging in" do
      get :index, {}, valid_session
      puts response.body
      expect(response.body.include? "You need to sign in or sign up before continuing.").to eq true
    end
  end

end
