class ProfessorsController < ApplicationController
  def index
    @professors = policy_scope(Professor)
  end

  def show
    @sala = Sala.find(params[:sala_id])
    @prof = Professor.find(params[:id])
    @professor = Professor.find(params[:id])
    authorize @professor
  end

  def new
    @professor = Professor.new
    @sala = Sala.find(params[:sala_id])
    authorize @professor
  end

  def create
    @professor = Professor.new(professor_params)
    @sala = Sala.find(params[:sala_id])
    @professor.role = "Professor"
    authorize @professor
    if @professor.save
      @join = Join.create(sala: @sala, professor: @professor)
      authorize @join
      @prof = User.create(email: @professor.email, password: @professor.password, role: "Professor")
      authorize @prof
      redirect_to sala_professor_path(@sala, @professor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def edit
    @sala = Sala.find(params[:sala_id])
    @prof = Professor.find(params[:id])
    authorize @prof
  end

  def update
    @email = Professor.find(params[:id]).email
    @sala = Sala.find(params[:sala_id])
    @prof = Professor.find(params[:id])
    authorize @prof
    if @prof.update(professor_params) == false
      render :edit, status: :unprocessable_entity
    else
      @user = User.find_by(email: @email)
      @user.update!(email: params[:professor][:email])
      redirect_to sala_professor_path(@sala, @prof)
    end
  end

  private

  def professor_params
    params.require(:professor).permit(:email, :role, :name, :password)
  end
end
