class AlunosController < ApplicationController
  def index
    @alunos = policy_scope(Aluno)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
