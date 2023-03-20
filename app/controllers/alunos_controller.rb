class AlunosController < ApplicationController
  def index
    @alunos = policy_scope(Aluno)
  end

  def show
    @aluno = Aluno.find(params[:id])
    authorize @aluno
  end

  def new
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.new
    authorize @aluno
  end

  def create
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.new(aluno_params)
    @aluno.sala_id = @sala.id
    @aluno.role = 'Aluno'
    authorize @aluno
    if @aluno.save
      @aluno_user = User.create(email: @aluno.email, password: @aluno.password, role: "Aluno")
      authorize @aluno_user
      redirect_to sala_path(@sala)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def aluno_params
    params.require(:aluno).permit(:matricula, :name, :nascimento, :status, :email, :password)
  end
end
