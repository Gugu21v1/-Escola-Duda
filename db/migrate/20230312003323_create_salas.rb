class CreateSalas < ActiveRecord::Migration[7.0]
  def change
    create_table :salas do |t|
      t.string :ano
      t.string :nome
      t.references :professor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
