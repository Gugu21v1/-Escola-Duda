class JoinMateriasProfsController < ApplicationController
  def new
    @join = JoinMateriasProf.new
    authorize @join
  end

  def create
    @materia = Horario.find_by(nome: params[:join_materias_prof][:sala_id])
    @prof = Professor.find(params[:join_materias_prof][:materia_id])
    @join = Join.new(join_params)
    authorize @join
    @join.horario_id = @materia.id
    @join.professor = @prof
    if @join.save
      redirect_to sala_path(@sala)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def join_params
    params.require(:join_materias_prof).permit(:professor_id, :horario_id)
  end
end
