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
end
