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
    @horarios = []
    if current_user.admin == true
      Horario.all.each do |horario|
        @horarios << horario.nome
      end
    else
      prof = Professor.find_by(email: current_user.email)
      @horarios << JoinMateriasProf.find_by(professor: prof).horario.nome
    end
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.find(params[:aluno_id])
    @horario = Horario.find_by(nome: params[:notas_aluno][:horario_id])
    @trimestre = params[:notas_aluno][:trimestre]
    @nota = NotasAluno.new(nota_params)
    @nota.aluno = @aluno
    @nota.horario = @horario
    @nota.trimestre = @trimestre
    authorize @nota
    if @nota.save
      redirect_to sala_aluno_path(@sala, @aluno)
    else
      render 'alunos/show', status: :unprocessable_entity
    end
  end

  def edit
    @nota = NotasAluno.find(params[:id])
  end

  def update
    @sala = Sala.find(params[:sala_id])
    @nota = NotasAluno.find(params[:id])
    @nota.update(nota_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to sala_aluno_path(@sala, @aluno)
  end

  private

  def nota_params
    params.require(:notas_aluno).permit(:nota, :aluno_id, :horario_id, :trimestre)
  end
end
