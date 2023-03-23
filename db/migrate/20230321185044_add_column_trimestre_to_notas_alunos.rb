class AddColumnTrimestreToNotasAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :notas_alunos, :trimestre, :string
  end
end
