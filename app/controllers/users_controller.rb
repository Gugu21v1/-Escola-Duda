class UsersController < ApplicationController
  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      redirect_to professor_path(@professor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def professor_params
    params.require(:professor).permit(:name)
  end
end
