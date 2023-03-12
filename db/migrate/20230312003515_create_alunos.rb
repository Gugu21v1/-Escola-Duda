class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :matricula
      t.string :name
      t.references :salas, null: false, foreign_key: true
      t.string :nascimento
      t.string :conceitos
      t.integer :faltas

      t.timestamps
    end
  end
end
