class AddColumnPasswordToProfessors < ActiveRecord::Migration[7.0]
  def change
    add_column :professors, :password, :string
  end
end
