class Aluno < ApplicationRecord
  validates :email, presence: true, format: { with: /\S+@\S{1,9}\.[a-z]{2,3}/i }, uniqueness: true

  before_validation on: :create do
    User.all.each do |user|
      if user.email == email
        errors.add(:email, "já cadastrado")
      end
    end
  end

  has_many :notas_alunos, dependent: :destroy

  belongs_to :sala

  has_many :bookmarks

  validates :name, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }
  validates :matricula, :name, :nascimento, :status, :password, presence: true
  validates :matricula, uniqueness: true

  private

  def ensure_email_is_unique
    if User.where("email = ?", email).nil? == false
      errors.add(:email, "já cadastrado")
    end
  end
end
