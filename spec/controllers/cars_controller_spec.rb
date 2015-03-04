require 'rails_helper'
RSpec.describe CarsController, type: :controller do
  # Read up on let vs before. The article is very informative.
  # https://www.launchacademy.com/codecabulary/learn-test-driven-development/rspec/before-vs-let


  # Attributes that will prevent a creation or update of a car. Needs to contain the actual
  # parameters being expected. Just with bad data.
  let(:invalid_attributes) {
    { name: nil, description: nil, price: "string" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CarsController. Be sure to keep this updated too.
  let(:valid_session) { { } }

  describe "GET #index" do
    it "assigns all cars as @cars" do
      # Without stubs
      #car = FactoryGirl.create(:car)
      #car_2 = FactoryGirl.create(:car)
      
      # With stubs
      car = FactoryGirl.build(:car) # builds but doesn't save a car
      car_2 = FactoryGirl.build(:car)
      # We know that GET #index is going to call Car.all() so that's the function to prevent hitting the database
      # for no reason, slowing down the tests and needing to create actual cars, insert them in the database and
      # then get them back from the database. We assume that the Car model is working properly. The Car model tests
      # are responsible for whether they are in-fact working properly or not.
      Car.stubs(:all).returns([car, car_2])

      get :index, {}, valid_session
      expect(assigns(:cars)).to eq([car, car_2])
    end

    it "assigns no cars as @cars if there are none" do
      Car.stubs(:all).returns(nil)

      get :index, {}, valid_session
      expect(assigns(:cars)).to be_nil
    end
  end

  describe "GET #show" do
    it "assigns the requested car as @car" do
      # The below is how we would test this without stubs. But this is hitting the database for no reason..
      car = FactoryGirl.create(:car)
      get :show, {:id => car.to_param}, valid_session
      expect(assigns(:car)).to eq(car)
    end
  end

  describe "GET #new" do
    it "assigns a new car as @car" do
      get :new, {}, valid_session
      expect(assigns(:car)).to be_a_new(Car)
    end
  end

  describe "GET #edit" do
    it "assigns the requested car as @car" do
      car = FactoryGirl.create(:car)
      get :edit, {:id => car.to_param}, valid_session
      expect(assigns(:car)).to eq(car)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Car" do
        expect {
          post :create, {:car => FactoryGirl.attributes_for(:car)}, valid_session
        }.to change(Car, :count).by(1)
      end

      it "assigns a newly created car as @car" do
        post :create, {:car => FactoryGirl.attributes_for(:car)}, valid_session
        expect(assigns(:car)).to be_a(Car)
        expect(assigns(:car)).to be_persisted
      end

      it "redirects to the created car" do
        post :create, {:car => FactoryGirl.attributes_for(:car)}, valid_session
        expect(response).to redirect_to(Car.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved car as @car" do
        post :create, {:car => invalid_attributes}, valid_session
        expect(assigns(:car)).to be_a_new(Car)
      end

      it "re-renders the 'new' template" do
        post :create, {:car => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested car" do
        car = FactoryGirl.create(:car)
        put :update, {:id => car.to_param, :car => { name: "updated name" }}, valid_session
        car.reload
        expect(car.name).to eq "updated name"
        put :update, {:id => car.to_param, :car => { description: "updated description"}}, valid_session
        car.reload
        expect(car.description).to eq "updated description"
        put :update, {:id => car.to_param, :car => { price: 99999}}, valid_session
        car.reload
        expect(car.price).to eq 99999
      end

      it "assigns the requested car as @car" do
        car = FactoryGirl.create(:car)
        put :update, {:id => car.to_param, :car => FactoryGirl.attributes_for(:car)}, valid_session
        expect(assigns(:car)).to eq(car)
      end

      it "redirects to the car" do
        car = FactoryGirl.create(:car)
        put :update, {:id => car.to_param, :car => FactoryGirl.attributes_for(:car)}, valid_session
        expect(response).to redirect_to(car)
      end
    end

    context "with invalid params" do
      it "assigns the car as @car" do
        car = FactoryGirl.create(:car)
        put :update, {:id => car.to_param, :car => invalid_attributes}, valid_session
        expect(assigns(:car)).to eq(car)
      end

      it "re-renders the 'edit' template" do
        car = FactoryGirl.create(:car)
        put :update, {:id => car.to_param, :car => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested car" do
      car = FactoryGirl.create(:car)
      expect {
        delete :destroy, {:id => car.to_param}, valid_session
      }.to change(Car, :count).by(-1)
    end

    it "redirects to the cars list" do
      car = FactoryGirl.create(:car)
      delete :destroy, {:id => car.to_param}, valid_session
      expect(response).to redirect_to(cars_url)
    end
  end
end
