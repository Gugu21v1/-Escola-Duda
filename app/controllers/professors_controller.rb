class ProfessorsController < ApplicationController
  def index
  end

  def show
    @professor = Professor.find(params[:id])
    authorize @professor
  end

  def new
    @professor = Professor.new
    authorize @professor
  end

  def create
    @professor = Professor.new(professor_params)
    @professor.role = "Professor"
    authorize @professor
    if @professor.save
      @prof = User.create(email: @professor.email, password: @professor.password)
      authorize @prof
      redirect_to professor_path(@professor)
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

  def professor_params
    params.require(:professor).permit(:email, :role, :name, :password)
  end
end
