class RemoveColumnFromProfessors < ActiveRecord::Migration[7.0]
  def change
    remove_column :professors, :salas_id, :string
  end
end
