class HomeController < ApplicationController
  def index
  end

  def mapa
    if params[:search]
      @sistemas = Sistema.search(params[:search]).order("nome ASC")
    else
      @sistemas = Sistema.all.order("nome ASC")
    end
  end
end
