class Sala < ApplicationRecord
  belongs_to :professor
  has_many :alunos
end
