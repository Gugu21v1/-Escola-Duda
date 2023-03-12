class Professor < ApplicationRecord
  validates :email, presence: true, format: { with: /\S+@\S{1,9}\.[a-z]{2,3}/i }
  validates :name, :password, presence: true
  validates :name, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }
end
