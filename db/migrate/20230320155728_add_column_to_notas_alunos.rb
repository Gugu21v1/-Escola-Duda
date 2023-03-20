class AddColumnToNotasAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :notas_alunos, :nota, :string
  end
end
