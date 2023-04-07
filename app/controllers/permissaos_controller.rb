class PermissaosController < ApplicationController
  def edit
    @perm = Permissao.new
    authorize @perm
  end

  def update
    if current_user.admin? == false
      redirect_to root_path
      flash[:alert] = "Você não tem permissão para acessar essa página!"
    end
    @perm = Permissao.find(1)
    authorize @perm
    @perm.update(perm_params)
  end

  private

  def perm_params
    params.require(:permissao).permit(:visivel)
  end
end
