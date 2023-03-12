class CreateMateria < ActiveRecord::Migration[7.0]
  def change
    create_table :materia do |t|
      t.string :nome
      t.references :professor, null: false, foreign_key: true
      t.integer :aulas_dadas
      t.integer :aulas_previstas

      t.timestamps
    end
  end
end
