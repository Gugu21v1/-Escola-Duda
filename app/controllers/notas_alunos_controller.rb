class NotasAlunosController < ApplicationController
  def new
    @aluno = Aluno.find(params[:aluno_id])
    @sala = Sala.find(params[:sala_id])
    @nota = NotasAluno.new
    authorize @nota
    @horarios = []
    if current_user.admin == true
      Horario.all.each do |horario|
        @horarios << horario.nome
      end
    else
      prof = Professor.find_by(email: current_user.email)
      @horarios << JoinMateriasProf.find_by(professor: prof).horario.nome
    end
  end

  def create
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.find(params[:aluno_id])
    @horario = JoinMateriasProf.find_by(professor: Professor.find_by(email: current_user.email))
    @nota = NotasAluno.new(nota_params)
    @nota.aluno = @aluno
    @nota.horario = @horario
    authorize @nota
    if @nota.save
      redirect_to sala_aluno_path(@sala, @aluno)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def nota_params
    params.require(:notas_aluno).permit(:nota, :aluno_id, :horario_id)
  end
end
