class CreateNota < ActiveRecord::Migration[7.0]
  def change
    create_table :nota do |t|
      t.references :materia, null: false, foreign_key: true
      t.references :aluno, null: false, foreign_key: true
      t.string :conceitos

      t.timestamps
    end
  end
end
