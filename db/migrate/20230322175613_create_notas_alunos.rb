class CreateNotasAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :notas_alunos do |t|
      t.string :nota
      t.string :trimestre
      t.references :aluno, null: false, foreign_key: true
      t.references :horario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
