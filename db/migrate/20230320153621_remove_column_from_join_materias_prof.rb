class RemoveColumnFromJoinMateriasProf < ActiveRecord::Migration[7.0]
  def change
    remove_column :join_materias_profs, :materia_id
  end
end
