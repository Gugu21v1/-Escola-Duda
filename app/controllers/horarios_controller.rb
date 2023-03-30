class HorariosController < ApplicationController
  def edit
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.find(params[:aluno_id])
    authorize @aluno
  end

  def update
    @sala = Sala.find(params[:sala_id])
    @horario = @sala.horarios.find(params[:id])
    @aluno = Aluno.find(params[:aluno_id])
    authorize @aluno
    if @horario.update(horario_params) == false
      render 'aluno/show', status: :unprocessable_entity
    end
  end

  private

  def horario_params
    params.require(:horario).permit(:nome, :sala_id, :aulas_dadas, :aulas_previstas)
  end
end
