class Horario < ApplicationRecord
  has_many :join_materias_profs, dependent: :destroy
  has_many :professors, through: :join_materias_profs
end