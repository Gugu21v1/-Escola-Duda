class CreateJoin < ActiveRecord::Migration[7.0]
  def change
    create_table :joins do |t|
      t.references :professor, null: false, foreign_key: true
      t.references :sala, null: false, foreign_key: true

      t.timestamps
    end
  end
end
