class ExperimentosController < ApplicationController
  before_action :set_experimento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] { check_owner Experimento.friendly.find(params[:id]).sistema.user_id }
  before_action :load_sistemas, except: [:index]
  before_action :load_plantas, except: [:index]
  before_action :load_fases

  # GET /experimentos
  # GET /experimentos.json
  def index
    @experimentos = Experimento.all.order("nome ASC")

    if params[:search]
      @experimentos = Experimento.search(params[:search]).order("nome ASC")
    else
      if params[:sistema_id]
        @experimentos = Sistema.friendly.find(params[:sistema_id]).experimentos
      elsif params[:planta_id]
        @experimentos = Planta.friendly.find(params[:planta_id]).experimentos
      end
    end
  end

  # GET /experimentos/1
  # GET /experimentos/1.json
  def show
  end

  # GET /experimentos/new
  def new
    @experimento = Experimento.new
    @experimento.experimento_plantas.build
  end

  # GET /experimentos/1/edit
  def edit
    @plantas = Planta.all
    @experimento.experimento_plantas.build
  end

  # POST /experimentos
  # POST /experimentos.json
  def create
    @experimento = Experimento.new(experimento_params)

    respond_to do |format|
      if @experimento.save
        format.html { redirect_to @experimento, notice: "Experimento was successfully created." }
        format.json { render :show, status: :created, location: @experimento }
      else
        format.html { render :new }
        format.json { render json: @experimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experimentos/1
  # PATCH/PUT /experimentos/1.json
  def update
    respond_to do |format|
      if @experimento.update(experimento_params)
        format.html { redirect_to @experimento, notice: "Experimento was successfully updated." }
        format.json { render :show, status: :ok, location: @experimento }
      else
        format.html { render :edit }
        format.json { render json: @experimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experimentos/1
  # DELETE /experimentos/1.json
  def destroy
    @experimento.destroy
    respond_to do |format|
      format.html { redirect_to experimentos_url, notice: "Experimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def load_sistemas
      @sistemas = {}
      if user_signed_in?
        @sistemas = current_user.admin ? Sistema.all : Sistema.where("user_id = #{current_user.id}")
      end
    end

    def load_plantas
      @plantas = Planta.all
    end

    def load_fases
      @fases = { "Planejamento" => "Planejamento", "Em Progresso" => "Em Progresso", "Finalizado" => "Finalizado" }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_experimento
      @experimento = Experimento.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experimento_params
      params.require(:experimento).permit(:nome, :descricao, :slug, :sistema_id, :imagem, :inicio, :fim, :fase, :experimento_id, planta_ids: [])
    end
end
