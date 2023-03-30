class Sala < ApplicationRecord
  validates :nome, :ano, presence: true
  validates :nome, uniqueness: true

  has_many :alunos, dependent: :destroy
  has_many :horarios, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :professors, through: :joins
end
