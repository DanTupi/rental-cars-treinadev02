class ManufacturersController < ApplicationController
  #before_action :authenticate_user!
  #before_action :authorize_admin,
  #before_action :set_manufacturer, only: [:show, :edit, :update]

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    set_manufacturer
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:alert] = "#{@manufacturer.name} cadastrado com sucesso"
      redirect_to @manufacturer
    else
      render :new
    end
  end

  def edit
    set_manufacturer
  end

  def update
    set_manufacturer
    if @manufacturer.update(manufacturer_params)
      flash[:notice] = 'Fabricante atualizado com sucesso'
      redirect_to @manufacturer
    else
      render :edit
    end
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end

  def authorize_admin
    redirect_to root_path, notice: 'Você não tem autorização para isso!' unless current_user.admin?
  end
end
