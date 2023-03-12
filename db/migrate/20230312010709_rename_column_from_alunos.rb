class RenameColumnFromAlunos < ActiveRecord::Migration[7.0]
  def change
    rename_column :alunos, :salas_id, :sala_id
  end
end
