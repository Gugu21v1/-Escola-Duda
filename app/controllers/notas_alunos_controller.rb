class NotasAlunosController < ApplicationController
  def new
    @aluno = Aluno.find(params[:aluno_id])
    @sala = Sala.find(params[:sala_id])
    @nota = NotasAluno.new
    authorize @nota
    @horarios = []
    if current_user.admin == true
      @sala.horarios.each do |horario|
        if @horarios.include?(horario.nome) == false
          @horarios << horario.nome
        end
      end
    elsif current_user.role == "Professor"
      prof = Professor.find_by(email: current_user.email)
      JoinMateriasProf.where(professor: prof).each do |horario|
        @horarios << horario.horario.nome
      end
    end
  end

  def create
    @horarios = []
    @sala = Sala.find(params[:sala_id])
    if current_user.admin == true
      @sala.horarios.each do |horario|
        if @horarios.include?(horario.nome) == false
          @horarios << horario.nome
        end
      end
    elsif current_user.role == "Professor"
      prof = Professor.find_by(email: current_user.email)
      JoinMateriasProf.where(professor: prof).each do |horario|
        @horarios << horario.horario.nome
      end
    end
    @aluno = Aluno.find(params[:aluno_id])
    @horario = @sala.horarios.find_by(nome: params[:notas_aluno][:horario_id], trimestre: params[:notas_aluno][:trimestre])
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
    @horario = Horario.all
    @aluno = Aluno.find(params[:aluno_id])
    @sala = Sala.find(params[:sala_id])
    @nota = NotasAluno.find(params[:id])
    authorize @nota
    if @nota.update(nota_params) == false
      render 'alunos/show', status: :unprocessable_entity
    end
  end

  def destroy
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.find(params[:aluno_id])
    @nota = NotasAluno.find(params[:id])
    authorize @nota
    @nota.destroy
    redirect_to sala_aluno_path(@sala, @aluno), status: :see_other
  end

  private

  def nota_params
    params.require(:notas_aluno).permit(:nota, :aluno_id, :horario_id, :trimestre, :aulas_dadas, :aulas_previstas)
  end
end
