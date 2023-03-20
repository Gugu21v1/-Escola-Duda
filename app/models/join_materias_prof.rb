class JoinMateriasProf < ApplicationRecord
  belongs_to :professor
  belongs_to :horario

  validates :professor, uniqueness: { scope: :horario }
  validates :professor_id, :horario_id, presence: true
end
