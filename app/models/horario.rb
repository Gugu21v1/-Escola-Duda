class Horario < ApplicationRecord
  belongs_to :sala
  has_many :join_materias_profs, dependent: :destroy
  has_many :professors, through: :join_materias_profs

  has_many :notas_alunos, dependent: :destroy
end
