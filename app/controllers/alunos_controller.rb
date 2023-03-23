class AlunosController < ApplicationController
  def index
    @alunos = policy_scope(Aluno)
    @lista = []
    if params[:query]
      pesquisa_separada = params[:query].upcase.split
      pesquisa_separada.each do |palavra|
        p palavra
        Aluno.all.each do |aluno|
          if aluno.name.upcase.include?(palavra) ||
            aluno.matricula.include?(palavra)
            if @lista.include?(aluno) == false
              @lista << aluno
            end
          end
        end
      end
    end
  end

  def show
    @horarios = []
    @nomes = []
    if current_user.admin == true
      Horario.all.each do |horario|
        @nomes << horario.nome
      end
    else
      prof = Professor.find_by(email: current_user.email)
      horarios = JoinMateriasProf.where(professor: prof)
      horarios.each do |horario|
        @nomes << Horario.find_by(id: horario.horario_id).nome
      end
    end
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.find(params[:id])
    @nota = NotasAluno.new
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
