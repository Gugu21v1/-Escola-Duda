class AddColumnToJoinMateriasProf < ActiveRecord::Migration[7.0]
  def change
    add_reference :join_materias_profs, :horario, null: false, foreign_key: true
  end
end
