class User < ApplicationRecord
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(["lower(matricula) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:matricula].nil?
        where(conditions).first
      else
        where(matricula: conditions[:matricula]).first
      end
    end
  end

  def login
    @login || self.matricula || self.email
  end
end
