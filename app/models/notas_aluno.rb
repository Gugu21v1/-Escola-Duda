class NotasAluno < ApplicationRecord
  belongs_to :horario
  belongs_to :aluno

  validates :nota, :horario, :trimestre, presence: true
end
