class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.string :nome
      t.string :aulas_dadas
      t.string :aulas_previstas

      t.timestamps
    end
  end
end
