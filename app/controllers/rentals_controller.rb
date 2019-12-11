class RentalsController < ApplicationController
  def index

  end

  def show
    @rental = Rental.find(params[:id])
    @cars = @rental.car_category.cars
    #@cars = Car.joins(:car_model).where(car_models: {car_category: @rental.carcategory}) #car category está dentro do car model
    # se fosse vizinhas, seria car_model, car_category
  end

  def new
    @rental = Rental.new
    @clients = Client.all
    @car_categories = CarCategory.all
  end

  def create
    @rental = Rental.new(params.require(:rental). permit(:star_date, :end_date,
                                                          :client_id,
                                                          :car_category_id))
    if
      @rental.save
      redirect_to @rental, notice: 'Locação agendada com sucesso'
    else
      @clients = Client.all?
      @car_categories = CarCategory.all
      render :new
    end
  end

  def search
      @rentals = Rental.where('reservation_code like ?', "%#{params[:q]}%")

      # TODO criar uma view de search
      render :index
  end

  def start
    @rental = Rental.find(params[:id])
    @rental.in_progress!
    # @rental.update(status: :in_progress) mesma coisa do de cima
    @car = Car.find(params[:rental][:car_id])
    @car.unavailable!
    @rental.create_car_rental(car: @car, price: @car.price)
    # ou =  CarRental.create(rental: @rental, cars: @car, price: 9)
    flash[:notice] = 'Locação iniciada com sucesso'
    redirect_to @rental
  end

end
