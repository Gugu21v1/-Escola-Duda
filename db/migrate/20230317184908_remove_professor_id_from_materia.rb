class RemoveProfessorIdFromMateria < ActiveRecord::Migration[7.0]
  def change
    remove_column :materia, :professor_id, :bigint
  end
end
