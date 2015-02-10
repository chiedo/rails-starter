class CarsController < ApplicationController
  def new
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.json  { render(:json => @car,
                      :status => :created, :location => @car) }
      else
        format.json { render(:json => @car.errors,
                      :status => :unprocessable_entity) }
      end
    end
  end


  def update
  end

  def edit
  end

  def destroy
  end

  def index
    render json: Car.all
  end

  def show
    render json: Car.find(params[:id])
  end

  private
    def car_params
      params.require(:car).permit(:name, :description, :price)
    end
end
