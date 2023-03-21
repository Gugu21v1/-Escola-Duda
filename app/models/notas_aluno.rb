class NotasAluno < ApplicationRecord
  belongs_to :horario
  belongs_to :aluno, dependent: :destroy

  validates :nota, :horario_id, presence: true
end
