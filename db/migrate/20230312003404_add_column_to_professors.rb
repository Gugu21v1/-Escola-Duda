class AddColumnToProfessors < ActiveRecord::Migration[7.0]
  def change
    add_reference :professors, :salas, null: false, foreign_key: true
  end
end
