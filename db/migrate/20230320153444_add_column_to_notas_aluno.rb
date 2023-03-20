class AddColumnToNotasAluno < ActiveRecord::Migration[7.0]
  def change
    add_reference :notas_alunos, :horario, null: false, foreign_key: true
  end
end
