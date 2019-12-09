class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    set_car
    @cars = Car.all
  end

  def new
    @car = Car.new
    @car_categories = CarCategory.all
    @subsidiaries = Subsidiary.all
    @car_models = CarModel.all
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car
    else
      @car_categories = CarCategory.all
      @subsidiaries = Subsidiary.all
      @car_models = CarModel.all
      render :new
    end
  end

  private

def set_car
  @car = Car.find(params[:id])
end
  def car_params
    params.require(:car).permit(:license_plate, :color, :car_model_id,
                                :mileage, :subsidiary_id)
  end

end
