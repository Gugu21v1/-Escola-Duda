class HorariosController < ApplicationController
  def edit
    @sala = Sala.find(params[:sala_id])
    @horario = @sala.horarios.find(params[:id])
    authorize @horario
  end

  def update
    @sala = Sala.find(params[:sala_id])
    @horario = @sala.horarios.find(params[:id])
    authorize @horario
    @horario.update(horario_params)
  end

  private

  def horario_params
    params.require(:horario).permit(:nome, :sala_id, :aulas_dadas, :aulas_previstas)
  end
end
