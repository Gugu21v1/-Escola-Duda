class RemoveColumnProfessorIdFromSalas < ActiveRecord::Migration[7.0]
  def change
    remove_column :salas, :professor_id, :string
  end
end
