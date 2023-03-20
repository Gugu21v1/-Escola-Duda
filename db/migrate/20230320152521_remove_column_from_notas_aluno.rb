class RemoveColumnFromNotasAluno < ActiveRecord::Migration[7.0]
  def change
    remove_column :notas_alunos, :materium_id, :string
  end
end
