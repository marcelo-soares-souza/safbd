class HomeController < ApplicationController
  def index
  end

  def mapa
    @sistemas = Sistema.all.order('nome ASC')
  end
end
