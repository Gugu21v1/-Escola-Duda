class AddColumnRoleToProfessors < ActiveRecord::Migration[7.0]
  def change
    add_column :professors, :role, :string
  end
end
