class JoinMateriasProfsController < ApplicationController
  def new
    @join = JoinMateriasProf.new
    authorize @join
  end

  def create
    @materia = Horario.find_by(nome: params[:join_materias_prof][:horario_id])
    @prof = Professor.find(params[:join_materias_prof][:professor_id])
    @join = JoinMateriasProf.new(join_params)
    authorize @join
    @join.horario_id = @materia.id
    @join.professor = @prof
    if @join.save
      redirect_to sala_professor_path(@prof.salas.first, @prof)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def join_params
    params.require(:join_materias_prof).permit(:professor_id, :horario_id)
  end
end
