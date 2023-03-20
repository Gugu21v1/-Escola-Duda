class Join < ApplicationRecord
  belongs_to :professor
  belongs_to :sala

  validates :professor, uniqueness: { scope: :sala }
  validates :professor_id, :sala_id, presence: true
end
