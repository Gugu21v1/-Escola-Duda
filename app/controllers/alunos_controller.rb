class AlunosController < ApplicationController
  def index
    @alunos = policy_scope(Aluno)
    @lista = []
    if params[:query]
      pesquisa_separada = I18n.transliterate(params[:query]).split
      pesquisa_separada.each do |palavra|
        Aluno.all.each do |aluno|
          if I18n.transliterate(aluno.name).upcase.include?(palavra.upcase) ||
            aluno.matricula.include?(palavra)
            if @lista.include?(I18n.transliterate(aluno.name)) == false
              p aluno.name
              @lista << aluno.name
            end
          end
        end
      end
    end
  end

  def show
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
    @aluno = Aluno.find(params[:id])
    authorize @aluno
    @nota = NotasAluno.new
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

  def edit
    @sala = Sala.find(params[:sala_id])
    @aluno = Aluno.find(params[:id])
    @lista = @sala.horarios
    authorize @aluno
  end

  def update
    @email = Aluno.find(params[:id]).email
    @sala = Sala.find(params[:sala_id])
    @lista = @sala.horarios
    @aluno = Aluno.find(params[:id])
    authorize @aluno
    if @aluno.update(aluno_params) == false
      render :edit, status: :unprocessable_entity
    else
      @user = User.find_by(email: @email)
      @user.update!(email: params[:aluno][:email])
      redirect_to sala_aluno_path(@sala, @aluno)
    end
  end

  private

  def aluno_params
    params.require(:aluno).permit(:matricula, :name, :nascimento, :status, :email, :password, :conceitos, :faltas)
  end
end
