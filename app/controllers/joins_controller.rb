class JoinsController < ApplicationController
  def new
    @join = Join.new
    authorize @join
  end

  def create
    @sala = Sala.find_by(nome: params[:join][:sala_id])
    @prof = Professor.find(params[:join][:professor_id])
    @join = Join.new(join_params)
    authorize @join
    @join.sala = @sala
    @join.professor = @prof
    if @join.save
      redirect_to sala_path(@sala)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def join_params
    params.require(:join).permit(:professor_id, :sala_id)
  end
end
