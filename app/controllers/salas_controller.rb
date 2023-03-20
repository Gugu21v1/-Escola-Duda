class SalasController < ApplicationController
  def new
    @sala = Sala.new
    authorize @sala
  end

  def create
    @sala = Sala.new(sala_params)
    authorize @sala
    if @sala.save
      redirect_to sala_path(@sala)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
    @sala = Sala.find(params[:id])
    authorize @sala
    @alunos = Aluno.where(sala_id: @sala.id)
    authorize @alunos
  end

  private

  def sala_params
    params.require(:sala).permit(:ano, :nome)
  end
end
