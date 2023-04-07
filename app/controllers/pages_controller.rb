class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @salas = Sala.all
    if user_signed_in?
      if current_user.admin == true
        current_user.role = "Admin"
      end
    end
  end

  def admin
    if current_user.admin? == false
      redirect_to root_path
      flash[:alert] = "Você não tem permissão para acessar essa página!"
    end
    @perm = Permissao.find(1)
  end

  private

  def admin?
    current_user.admin?
  end
end
