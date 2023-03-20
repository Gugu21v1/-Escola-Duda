class Professor < ApplicationRecord
  has_many :joins, dependent: :destroy
  has_many :salas, through: :joins

  before_validation do
    User.all.each do |user|
      if user.email == email
        errors.add(:email, "já cadastrado")
      end
    end
  end

  has_many :join_materias_profs, dependent: :destroy
  has_many :horarios, through: :join_materias_profs

  validates :email, presence: true, format: { with: /\S+@\S{1,9}\.[a-z]{2,3}/i }, uniqueness: true
  validates :name, :password, presence: true
  validates :name, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }
end
