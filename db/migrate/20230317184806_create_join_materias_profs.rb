class CreateJoinMateriasProfs < ActiveRecord::Migration[7.0]
  def change
    create_table :join_materias_profs do |t|
      t.references :professor, null: false, foreign_key: true
      t.references :materia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
