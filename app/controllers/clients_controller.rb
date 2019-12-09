class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:alert] = "Cliente registrado com sucesso"
      redirect_to clients_path
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :document, :email)
  end

end
