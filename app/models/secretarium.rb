class Secretarium < ApplicationRecord
  before_validation do
    User.all.each do |user|
      if user.email == email
        errors.add(:email, "já cadastrado")
      end
    end
  end
end
