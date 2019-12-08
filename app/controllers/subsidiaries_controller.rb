class SubsidiariesController < ApplicationController
  #before_action :authenticate_user!
  #before_action :authorize_admin,
  #before_action :set_manufacturer, only: [:show, :edit, :update]

  def index
    @subsidiaries = Subsidiary.all
  end

  def show
    set_subsidiary
  end

  def new
    @subsidiary = Subsidiary.new
  end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)
    if @subsidiary.save
      flash[:alert] = "#{@manufacturer.name} cadastrado com sucesso"
      redirect_to @subsidiary
    else
      render :new
    end
  end

  def edit
    set_subsidiary
  end

  def update
    set_subsidiary
    if @subsidiary.update(subsidiary_params)
      flash[:notice] = 'Filial atualizado com sucesso'
      redirect_to @subsidiary
    else
      render :new
    end
  end

  def destroy
    set_subsidiary
    @subsidiary.destroy
    redirect_to subsidiaries_path
  end

  private

  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:id])
  end

  def subsidiary_params
    params.require(:subsidiary).permit(:name, :cnpj, :address)
  end

  def authorize_admin
    redirect_to root_path, notice: 'Você não tem autorização para isso!' unless current_user.admin?
  end
end
