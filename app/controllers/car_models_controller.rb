class CarModelsController < ApplicationController
  #before_action :authenticate_user!
  #before_action :authorize_admin,
  #before_action :set_car_model, only: [:show, :edit, :update]


  def index
    @car_models = CarModel.all
  end

  def show
    set_car_model
  end

  def new
    @car_model = CarModel.new
    @manufacturers = Manufacturer.all
    @car_categories = CarCategory.all
  end

  def create
    @car_model = CarModel.new(car_model_params)
    if @car_model.save
      redirect_to @car_model
      flash[:notice] = 'Modelo registrado com sucessso'
    else
      @manufacturers = Manufacturer.all
      @car_categories = CarCategory.all
      render :new
    end
  end

  def edit
    set_car_model
    @manufacturers = Manufacturer.all
    @car_categories = CarCategory.all
  end

  def update
    @car_model = CarModel.new(car_model_params)
  end

  private

def set_car_model
  @car_model = CarModel.find(params[:id])

end

  def car_model_params
    params.require(:car_model).permit(:name, :fuel_type, :motorization,
                                      :car_category_id, :year, :manufacturer_id)
  end

  def authorize_admin
    redirect_to root_path, notice: 'Você não tem autorização para isso!' unless current_user.admin?
  end
end
