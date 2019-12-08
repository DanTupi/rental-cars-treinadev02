class CarCategoriesController < ApplicationController
  #before_action :authenticate_user!
  #before_action :authorize_admin,
  #before_action :set_car_category, only: [:show, :edit, :update]
  
  def index
    @car_categories = CarCategory.all
  end

  def show
    set_car_category
  end

  def new
    @car_category = CarCategory.new
  end

  def create
    @car_category = CarCategory.new(car_categories_params)
    if @car_category.save
      redirect_to @car_category
    else
      render :new
    end
  end

  def edit
    set_car_category
  end

  def update
    set_car_category
    if @car_category.update(car_categories_params)
      redirect_to @car_category
    else
      render :edit
    end
  end

  private

  def set_car_category
    @car_category = CarCategory.find(params[:id])
  end

  def car_categories_params
    params.require(:car_category).permit(:name, :car_insurance, :daily_rate,
                                         :third_party_insurance)
  end

  def authorize_admin
    redirect_to root_path, notice: 'Você não tem autorização para isso!' unless current_user.admin?
  end
end
